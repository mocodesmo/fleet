from fastapi import Header, status
from fastapi.param_functions import Depends
from fastapi.responses import JSONResponse
from starlette.status import HTTP_401_UNAUTHORIZED, HTTP_500_INTERNAL_SERVER_ERROR

from pkg.auth import auth
from crud.user import find_user, get_all_users


async def user_users_get(fid: str = Depends(auth)):
    user, err = find_user(fid)
    if err is not None:
        return JSONResponse(err.message, status_code=HTTP_500_INTERNAL_SERVER_ERROR)

    if not user.is_admin:
        return JSONResponse(err.message, status_code=HTTP_401_UNAUTHORIZED)

    users, err = get_all_users()
    if err is not None:
        return JSONResponse(err.message, status.HTTP_500_INTERNAL_SERVER_ERROR)

    return JSONResponse(users)
