from mongoengine import connect
from mongoengine.connection import get_connection
import pymongo
from mongoengine.queryset.queryset import QuerySet
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
def setup_mongo() -> None:
    try:
        connect(host="mongodb://localhost:27017/fleet")
    except Exception as e:
        # logger.error(e)
        raise e


def drop_collection(collection: str) -> None:
    client = pymongo.MongoClient("mongodb://localhost:27017")
    db = client['fleet']
    coll = db[collection]
    coll.drop()


class CustomQuerySet(QuerySet):
    def to_json(self):
        return "[%s]" % (",".join([doc.to_json() for doc in self]))


#import pymongo
#from pymongo.mongo_client import MongoClient
#from flask import Flask
#from flask_mongoengine import MongoEngine

# "mongodb+srv://@<cluster-url>/test?retryWrites=true&w=majority")
# db = client..test

# def connect_db() -> MongoClient:
#    client = pymongo.MongoClient("mongodb://localhost:27017")
#    dblist = client.list_database_names()
#    print(dblist)
#    return client

# def get_db(mng: MongoClient):
#    return mng["hut2"]
