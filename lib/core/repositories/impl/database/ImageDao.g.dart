// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImageDao.dart';

// ignore_for_file: type=lint
mixin _$ImageDaoMixin on DatabaseAccessor<GalleryDatabase> {
  $ImageEntitiesTable get imageEntities => attachedDatabase.imageEntities;
  ImageDaoManager get managers => ImageDaoManager(this);
}

class ImageDaoManager {
  final _$ImageDaoMixin _db;
  ImageDaoManager(this._db);
  $$ImageEntitiesTableTableManager get imageEntities =>
      $$ImageEntitiesTableTableManager(_db.attachedDatabase, _db.imageEntities);
}
