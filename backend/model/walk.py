from mongoengine import Document, StringField, PointField
from mongoengine.document import EmbeddedDocument
from mongoengine.fields import DateField, DateTimeField, EmbeddedDocumentField, ListField, ReferenceField
from bson import json_util


class Location(EmbeddedDocument):
    location = PointField()
    time = DateTimeField(required=True)


class Walk(EmbeddedDocument):
    start_time = DateTimeField(required=True)
    end_time = DateTimeField()
    route = ListField(EmbeddedDocumentField('Location'))
