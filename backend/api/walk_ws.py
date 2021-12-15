import json
from enum import Enum
from datetime import datetime
from model.walk import Walk
from crud.user import find_user
from typing import Dict, Optional
from fastapi import status
from pydantic import BaseModel
import asyncio
from aioredis.client import Redis

from fastapi import status
from fastapi.websockets import WebSocket
from starlette.websockets import WebSocketDisconnect

from pkg.auth import auth_direct
from crud.walk import start_walk, end_walk, update_location
from pkg.redis import get_redis


class MsgType(str, Enum):
    start_walk = "start_walk"
    end_walk = "end_walk"
    update_location = "update_location"
    auth = "auth"


class MsgDetails(BaseModel):
    event: MsgType
    lat: Optional[float] = None
    lng: Optional[float] = None
    time: datetime
    uid: str = None
    walk: Walk = None

    class Config:
        arbitrary_types_allowed = True


async def broadcast(r: Redis, payload: str):
    channels = await r.pubsub_channels()
    for channel in channels:
        await r.publish(channel, payload)


async def receiver(ws: WebSocket, r: Redis):
    try:
        while True:
            raw = await ws.receive_text()
            if raw is None:
                return
            data = json.loads(raw)

            if(data['event'] == MsgType.auth):
                token = data['tok']
                fid, err = auth_direct(token)
                if err is not None:
                    print('error on verify', err.message)
                    await ws.close(code=status.WS_1008_POLICY_VIOLATION)
                    return

                user, err = find_user(fid)
                if err is not None:
                    print('error on find', err.message)
                    await ws.close(status.WS_1008_POLICY_VIOLATION)
                    return

                ws.scope.update({'user_id': str(user.pk)})
                return

            print('data on_receive::', data)
            msg = MsgDetails(**data)
            from_user = ws.scope.get('user_id')

            if(msg.event == MsgType.start_walk):
                err = start_walk(from_user, msg.time)
                if err is not None:
                    print('on start walk ', err.message)
                    await ws.close(status.WS_1008_POLICY_VIOLATION)
                    return
                payload = json.dumps({
                    'uid': from_user,
                    'event': MsgType.start_walk,
                    # 'time': msg.time
                })
                await broadcast(r, payload)

            if(msg.event == MsgType.end_walk):
                err = end_walk(from_user, msg.time)
                if err is not None:
                    print('on end walk ', err.message)
                    await ws.close(status.WS_1008_POLICY_VIOLATION)
                    return
                payload = json.dumps({
                    'uid': from_user,
                    'event': MsgType.end_walk,
                    # 'time': msg.time
                })
                await broadcast(r, payload)

            if(msg.event == MsgType.update_location):
                # print(data['time'])
                walk, err = update_location(
                    from_user, msg.lat, msg.lng, msg.time)
                if err is not None:
                    print('on update loc ', err.message)
                    await ws.close(status.WS_1008_POLICY_VIOLATION)
                    return
                payload = json.dumps({
                    'uid': from_user,
                    'event': MsgType.update_location,
                    'walk': walk.to_json(),
                })
                await broadcast(r, payload)

    except WebSocketDisconnect as err:
        print(err)


async def sender(r: Redis, ws: WebSocket):
    from_user = ws.scope.get('user_id')
    channel = r.pubsub()
    await channel.psubscribe(str(from_user))
    try:
        while True:
            message = await channel.get_message(ignore_subscribe_messages=True)
            if message is not None:
                x = json.loads(message['data'])
                # .decode('utf8').replace("'", '"')
                await ws.send_text(json.dumps(x))

    except Exception as err:
        print(err)


async def redis_connector(websocket: WebSocket):
    redis = await get_redis()

    consumer_task = receiver(websocket, redis)
    producer_task = sender(redis, websocket)

    done, pending = await asyncio.wait(
        [consumer_task, producer_task], return_when=asyncio.FIRST_COMPLETED,
    )
    print(f"Done task: {done}")
    for task in pending:
        print(f"Canceling task: {task}")
        task.cancel()
    await redis.close()
    # await redis.wait()


async def walk_ws(websocket: WebSocket):
    try:
        await websocket.accept()
        print('---- WS CONNECTED ----')
        await redis_connector(websocket)

    except WebSocketDisconnect:
        print('--- EXCEPTION WS DISCONNECT---')
