import 'package:test_app/data/database/GalleryDatabase.dart';
import 'package:test_app/data/database/ImageDao.dart';
import 'package:test_app/data/database/ImagesEntities.dart';
import 'package:test_app/domain/model/GalleryImage.dart';
import 'package:test_app/domain/repositories/LocalRepository.dart';

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
