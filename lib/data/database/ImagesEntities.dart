import 'package:drift/drift.dart';
import 'package:test_app/domain/model/GalleryImage.dart';
import "GalleryDatabase.dart";

class ImageEntities extends Table {
  TextColumn get uuid => text()();
  TextColumn get source => textEnum<ImageSource>()();
  TextColumn get networkUrl => text().nullable()();
  TextColumn get localPath => text()();

  @override
  Set<Column> get primaryKey => {uuid};
}

extension ImageEntityMapper on ImageEntity {
  GalleryImage toDomain() {
    return GalleryImage(
      id: uuid,
      localPath: localPath,
      source: source,
      networkUrl: networkUrl,
    );
  }
}

extension GalleryImageMapper on GalleryImage {
  ImageEntitiesCompanion toEntityCompanion() {
    return ImageEntitiesCompanion(
      uuid: Value(id),
      source: Value(source),
      localPath: Value(localPath),
      networkUrl: Value(networkUrl),
    );
  }
}
