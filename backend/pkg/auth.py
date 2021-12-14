from typing import Tuple
from fastapi.websockets import WebSocket

from fastapi import Header, status
from fastapi import HTTPException
from pkg.error import Error
from pkg.firebase import verify_token

__test_auth = False


def enable_test_auth():
    global __test_auth
    __test_auth = True


def auth_direct(token: str) -> Tuple[str, Error]:

    if __test_auth is True:
        return token, None
    return verify_token(token)


def auth(auth: str = Header(...)) -> str:
    if __test_auth is True:
        if auth == '123':
            return auth
        else:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,
                                detail='WRonG')

    id, err = verify_token(auth)
    if err is not None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,
                            detail=err.message)
    return id


# async def auth_ws(websocket: WebSocket) -> str:
#     auth = websocket.headers.get('Auth')
#     fid, err = await verify_token(auth)
#     if err is not None:
#         print('error on verify', err.message)
#         await websocket.close(code=status.WS_1008_POLICY_VIOLATION)
#         raise '401 socket closed'

#     return fid
