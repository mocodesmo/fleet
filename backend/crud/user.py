import random
from typing import Tuple

from mongoengine.errors import NotUniqueError
from mongoengine.queryset.base import NULLIFY

from pkg.utils import str_to_bool
from pkg.error import Error, ErrorCodes, LogLevel, trace_to_string
from model.user import User


def find_user(fid: str) -> Tuple[User, Error]:
    try:
        user = User.objects(firebase_id=fid).first()
        if user is None:
            return None, Error(message='No User Found',
                               log_level=LogLevel.logWarn,
                               op='usermodel.finduser',
                               code=ErrorCodes.no_row)
        return user,  None
    except Exception as e:
        print('error find_user::', str(e))
        return None, Error(message='Error Occured',
                           log_level=LogLevel.logWarn,
                           op='usermodel.finduser',
                           code='mongo-error',
                           err=trace_to_string(e))


def find_user_with_id(id: str) -> Tuple[User, Error]:
    try:
        user = User.objects(pk=id).first()
        if user is None:
            return None, Error(message='No User Found',
                               log_level=LogLevel.logWarn,
                               op='usermodel.find_user_with_id',
                               code=ErrorCodes.no_row)
        return user,  None
    except Exception as e:
        return None, Error(message='Error Occured',
                           log_level=LogLevel.logWarn,
                           op='usermodel.find_user_with_id',
                           code='mongo-error',
                           err=trace_to_string(e))


def get_all_users() -> Tuple[str, Error]:
    try:
        users = User.objects
        us: str = '{ "walkers": ['
        for u in users:
            us += u.to_json() + ', '
        us = us[:-2]
        us += '] }'
        return us, None
    except Exception as e:
        return None, Error(message='Error Occured',
                           log_level=LogLevel.logWarn,
                           op='usermodel.get_all_users',
                           code='get_all_users',
                           err=trace_to_string(e))


def become_admin(fid: str) -> Error:
    try:
        user, err = find_user(fid)
        if err is not None:
            return err

        user.is_admin = True
        user.save()

        return None
    except Exception as e:
        return None, Error(message='Error Occured',
                           log_level=LogLevel.logWarn,
                           op='usermodel.become_admin',
                           code='become_admin',
                           err=trace_to_string(e))


def create_new_user(*, id: str, phone: str) -> Tuple[User, Error]:
    try:
        user = User()
        user.firebase_id = id
        user.phone = phone
        user.username = str(random.randint(0, 99999999))
        user = user.save()
        return user, None
    except NotUniqueError as nu:
        return None, Error(message='Duplicate User',
                           log_level=LogLevel.logWarn,
                           op='usermode.createnewuser',
                           code=ErrorCodes.not_unique)
    except Exception as e:
        return None, Error(message='Error Occured',
                           log_level=LogLevel.logWarn,
                           op='usermode.createnewuser',
                           code='create-user-error',
                           err=trace_to_string(e))
