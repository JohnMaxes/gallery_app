import "package:drift/drift.dart";
import "package:test_app/core/model/GalleryImage.dart";
import "package:test_app/core/repositories/impl/database/GalleryDatabase.dart";
import "ImagesEntities.dart";

part 'ImageDao.g.dart';

@DriftAccessor(tables: [ImageEntities])
class ImageDao extends DatabaseAccessor<GalleryDatabase> with _$ImageDaoMixin {
  ImageDao(super.db);

  Future<void> insertImageEntity(ImageEntitiesCompanion entity) {
    return into(imageEntities).insertOnConflictUpdate(entity);
  }

  Stream<List<ImageEntity>> getAllImages() {
    return select(imageEntities).watch();
  }

  Stream<List<ImageEntity>> getLocalImages() {
    return (select(imageEntities)
          ..where((item) => item.source.equals(ImageSource.local.toString())))
        .watch();
  }

  Stream<List<ImageEntity>> getNetworkImages() {
    return (select(imageEntities)
          ..where((item) => item.source.equals(ImageSource.network.toString())))
        .watch();
  }
}
