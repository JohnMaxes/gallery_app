import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/domain/model/GalleryImage.dart';
import 'package:test_app/domain/repositories/FileRepository.dart';
import 'package:test_app/domain/repositories/LocalRepository.dart';
import 'package:test_app/domain/repositories/NetworkRepository.dart';
import 'package:uuid/uuid.dart';

class GalleryUseCases {
  GalleryUseCases({
    required this.localRepo,
    required this.networkRepo,
    required this.fileRepo,
  });

  final LocalRepository localRepo;
  final NetworkRepository networkRepo;
  final FileRepository fileRepo;

  Stream<List<GalleryImage>> getLocalImages() =>
      localRepo.getLocalImagesStream();

  Stream<List<GalleryImage>> getNetworkImages() =>
      localRepo.getNetworkImagesStream();

  Stream<List<GalleryImage>> getAllImages() => localRepo.getAllImagesStream();

  Future<GalleryImage> getImageByUrl({required String url, String? id}) async {
    final dir = await getApplicationDocumentsDirectory();
    final finalId = id ?? Uuid().v8();
    final filePath = "${dir.path}/$finalId";
    final imageObject = GalleryImage(
      id: finalId,
      source: .network,
      localPath: filePath,
      networkUrl: url,
    );

    debugPrint("Awaiting $url");
    await networkRepo
        .downloadImageByUrlToPath(url: url, path: filePath)
        .onError((_, _) {
          return Future.error({});
        });
    await localRepo.upsertImageEntity(imageObject);
    debugPrint("Done await $url");

    return imageObject;
  }

  Future<GalleryImage> saveLocalImage({required String localPath}) async {
    final dir = await getApplicationDocumentsDirectory();
    final id = Uuid().v8();
    final finalPath = "${dir.path}/$id";
    final imageObject = GalleryImage(
      id: id,
      source: .local,
      localPath: finalPath,
      networkUrl: null,
    );

    await Future.wait([
      fileRepo.moveFile(from: localPath, to: finalPath),
      localRepo.upsertImageEntity(imageObject),
    ]);

    return imageObject;
  }
}
