from typing import Tuple
from pkg.error import Error, LogLevel

EINVALIDPHONE = 'Phone Number is invalid'


def is_phone_number(phone: str) -> Tuple[str, Error]:
    not_phone_error = Error(
        message=EINVALIDPHONE,
        log_level=LogLevel.logInfo,
        op='validation.isphonenumber',
        code='Invalid Phone Number'
    )

    if not phone.startswith('+'):
        return '', not_phone_error

    if " " not in phone:
        return '', not_phone_error

    fields = phone.split(' ')
    p0 = len(fields[0])
    p1 = len(fields[1])

    if p1 < 7 or p1 > 12 or p0 > 4:
        return '',  not_phone_error

    if not fields[1].isdecimal():
        return '',  not_phone_error

    if not fields[0].split('+')[1].isdecimal():
        return '', not_phone_error

    return phone, None
