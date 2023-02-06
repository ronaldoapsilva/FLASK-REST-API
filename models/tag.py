from db import db


class TagModel(db.Model):
    __tablename__ = 'tags'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    store_id = db.Column(db.Integer, db.ForeignKey("stores.id"), nullable=False)
    store = db.relationship('StoreModel', back_populates='tags')
    items = db.relationship('ItemModel', back_populates="tags", secondary="items_tags")

    # secondary attribute is the name of secondary table (items_tags to store tag for items), so slqalchemy will know where to look the tags for items