from mongoengine import Document, StringField, \
    BooleanField, ListField
from mongoengine.fields import EmbeddedDocumentField
from bson import json_util


class User(Document):
    firebase_id = StringField(unique=True)
    phone = StringField(unique=True)
    is_admin = BooleanField(default=False)
    walks = ListField(EmbeddedDocumentField('Walk'))
    is_walking = BooleanField(default=False)
    current_walk = EmbeddedDocumentField('Walk')