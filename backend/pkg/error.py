import enum
import traceback
from sentry_sdk import capture_exception


class LogLevel(enum.Enum):
    logNone = 'NONE'
    logInfo = 'INFO'
    logWarn = 'WARNING'


class Error():

    def __init__(self,
                 message: str,
                 op: str,
                 code: str,
                 log_level: LogLevel,
                 err: str = ''):
        self.message = message
        self.op = op
        self.code = code
        self.log_level = log_level
        self.error = err


class ErrorCodes(enum.Enum):
    no_row = 'NO ROW'
    not_unique = 'NOT UNIQUE'


def trace_to_string(ex: Exception) -> str:
    capture_exception(ex)
    return str(ex)
    # traceback.format_exc(etype=type(ex), value=ex, tb=ex.__traceback__)
