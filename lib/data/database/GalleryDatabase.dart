import "dart:io";

import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:path_provider/path_provider.dart";
import "package:test_app/domain/model/GalleryImage.dart";
import "ImagesEntities.dart";
import "ImageDao.dart";

part "GalleryDatabase.g.dart";

@DriftDatabase(tables: [ImageEntities], daos: [ImageDao])
class GalleryDatabase extends _$GalleryDatabase {
  GalleryDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/gallery.sqlite');

    return NativeDatabase(file);
  });
}
