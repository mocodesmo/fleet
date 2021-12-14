from fastapi import Header, status
from fastapi.param_functions import Depends
from fastapi.responses import JSONResponse

from pkg.validation import is_phone_number
from pkg.auth import auth
from pkg.error import ErrorCodes
from crud.user import become_admin


async def user_admin_post(fid: str = Depends(auth),
                          code: str = Header(...)):
    if code != 'bow-wow-wow':
        return JSONResponse('who are u?', status.HTTP_401_UNAUTHORIZED)

    err = become_admin(fid)
    if err is not None:
        return JSONResponse(err.message, status.HTTP_500_INTERNAL_SERVER_ERROR)

    return JSONResponse('OK')
