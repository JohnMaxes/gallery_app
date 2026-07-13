import 'package:test_app/core/repositories/LocalRepository.dart';

import 'package:test_app/core/model/GalleryImage.dart';
import 'package:test_app/core/repositories/impl/database/GalleryDatabase.dart';
import 'package:test_app/core/repositories/impl/database/ImageDao.dart';
import 'package:test_app/core/repositories/impl/database/ImagesEntities.dart';

class LocalRepositoryImpl implements LocalRepository {
  LocalRepositoryImpl({required this.db});
  final GalleryDatabase db;
  late ImageDao dao = ImageDao(db);

  @override
  Stream<List<GalleryImage>> getAllImagesStream() {
    return dao.getAllImages().map(
      (entities) => entities.map((entity) => entity.toDomain()).toList(),
    );
  }

  @override
  Stream<List<GalleryImage>> getLocalImagesStream() {
    return dao.getLocalImages().map(
      (entities) => entities.map((entity) => entity.toDomain()).toList(),
    );
  }

  @override
  Stream<List<GalleryImage>> getNetworkImagesStream() {
    return dao.getNetworkImages().map(
      (entities) => entities.map((entity) => entity.toDomain()).toList(),
    );
  }

  @override
  Future<void> upsertImageEntity(GalleryImage image) {
    return dao.insertImageEntity(image.toEntityCompanion());
  }
}
