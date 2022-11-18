import uuid
from flask import request
from flask.views import MethodView
from flask_smorest import Blueprint, abort
from sqlalchemy.exc import SQLAlchemyError

from db import db
from models import StoreModel
from schemas import StoreSchema

blp = Blueprint('Stores', __name__, description='Operations on stores')


@blp.route('/store/<string:store_id>')
class Store(MethodView):
    @blp.response(200, StoreSchema)
    def get(self, store_id):
        try:
            return stores[store_id]
        except KeyError:
            return abort(404, message='Store not found.')

    def delete(self, store_id):
        try:
            del stores[store_id]
            return {'message': 'Store deleted.'}
        except KeyError:
            return abort(404, message='Store not found.')


@blp.route('/store')
class Store(MethodView):
    @blp.response(200, StoreSchema(many=True))
    def get(self):
        return stores.values()

    @blp.arguments(StoreSchema)
    @blp.response(200, StoreSchema)
    def post(self, store_data):
        store = StoreModel(**store_data)

        try:
            db.session.add(store)
            db.session.commit()
        except SQLAlchemyError:
            abort(500, message="An error occurred while inserting the store.")
        return store
