from pkg.error import Error, LogLevel, trace_to_string
from typing import Tuple
import firebase_admin
from firebase_admin import auth,  credentials
import logging

from tenacity import after_log, before_log, retry, stop_after_attempt, wait_fixed

# logging.basicConfig(level=logging.INFO)
# logger = logging.getLogger(__name__)

# max_tries = 10
# wait_seconds = 1


# @retry(
#     stop=stop_after_attempt(max_tries),
#     wait=wait_fixed(wait_seconds),
#     # before=before_log(logger, logging.NOTSET),
#     after=after_log(logger, logging.WARN),
# )
def setup_firebase(is_test: bool = False):
    if is_test:
        return
    try:
        cred = credentials.Certificate(
            "000000.json")
        firebase_admin.initialize_app(credential=cred)
    # except ValueError as v:
    #     print('FB VALUE ERROR::', str(v))
    # except IOError as i:
    #     print('FB IOError ERROR::', str(i))
    except Exception as e:
        # logger.error(e)
        raise e


def verify_token(token: str) -> Tuple[str, Error]:
    try:
        decoded_token = auth.verify_id_token(token)
        uid = decoded_token["uid"]
        return str(uid),  None
    except Exception as e:
        print(str(e))
        return '',  Error(message='Not authenticated',
                          log_level=LogLevel.logWarn,
                          op='firebase.verifytoken',
                          code='user auth failed.',
                          err=trace_to_string(e))
