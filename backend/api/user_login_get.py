from crud.user import create_new_user, find_user
from fastapi import Header, status
from fastapi.param_functions import Depends
from fastapi.responses import JSONResponse

from pkg.validation import is_phone_number
from pkg.auth import auth
from pkg.error import ErrorCodes


async def user_login_get(fid: str = Depends(auth),
                         phone: str = Header(...)):
    phone_number, err = is_phone_number(phone)
    if err is not None:
        return JSONResponse(err.message, status.HTTP_400_BAD_REQUEST)

    user, err = find_user(fid)
    if err is not None:
        if err.code is not ErrorCodes.no_row:
            return JSONResponse(err.message, status.HTTP_500_INTERNAL_SERVER_ERROR)

        user, err = create_new_user(id=fid, phone=phone_number)
        if err is not None:
            if err.code is ErrorCodes.not_unique:
                return JSONResponse(err.message, status_code=status.HTTP_400_BAD_REQUEST)

            return JSONResponse(err.message, status.HTTP_500_INTERNAL_SERVER_ERROR)

    return JSONResponse(user.to_json())
