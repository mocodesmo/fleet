from fastapi import Header, status
from fastapi.param_functions import Depends
from fastapi.responses import JSONResponse

from pkg.validation import is_phone_number
from pkg.auth import auth
from pkg.error import ErrorCodes
from crud.user import become_admin


async def issue_post(issue: str = Header(...)):
    print('ISSUE::', issue)
    return JSONResponse('OK')
