import 'package:test_app/domain/model/GalleryImage.dart';

abstract interface class LocalRepository {
  Stream<List<GalleryImage>> getLocalImagesStream();
  Stream<List<GalleryImage>> getNetworkImagesStream();
  Stream<List<GalleryImage>> getAllImagesStream();
  Future<void> upsertImageEntity(GalleryImage image);
}
