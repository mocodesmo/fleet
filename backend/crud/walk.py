from crud.user import find_user_with_id
from datetime import datetime
from typing import Tuple
from model.walk import Location, Walk
from model.user import User
from pkg.error import Error, LogLevel, trace_to_string


def start_walk(uid: str,  time: datetime) -> Error:
    try:
        user, err = find_user_with_id(uid)
        if err is not None:
            return err

        user.is_walking = True

        if user.current_walk is not None:
            current_walk = user.current_walk
            try:
                current_walk.end_time = datetime.now()
            except:
                print('eee')
            user.walks.append(user.current_walk)
            user.current_walk = None

        new_walk = Walk()
        new_walk.start_time = time
        new_walk.end_time = datetime.now()
        new_walk.route = []
        user.current_walk = new_walk

        user.save()

        return None

    except Exception as e:
        return Error(message='Error Occured',
                     log_level=LogLevel.logWarn,
                     op='usermodel.start_walk',
                     code='start_walk',
                     err=trace_to_string(e))


def update_location(uid: str, lat: float, lng: float, time: datetime) -> Tuple[Walk, Error]:
    try:
        user, err = find_user_with_id(uid)
        if err is not None:
            return None, err

        location = Location()
        location.time = time
        location.location = [lng, lat]
        user.current_walk.route.append(location)
        user.save()

        return user.current_walk, None

    except Exception as e:
        return None, Error(message=str(e),
                           log_level=LogLevel.logWarn,
                           op='usermodel.update_location',
                           code='update_location',
                           err=trace_to_string(e))


def end_walk(uid: str, time: datetime) -> Error:
    try:
        user, err = find_user_with_id(uid)
        if err is not None:
            return err

        user.is_walking = False
        current_walk = user.current_walk
        current_walk.end_time = time
        user.walks.append(user.current_walk)
        user.save()
        user.update(unset__current_walk=True)

        return None

    except Exception as e:
        return Error(message='Error Occured',
                     log_level=LogLevel.logWarn,
                     op='usermodel.end_walk',
                     code='end_walk',
                     err=trace_to_string(e))
