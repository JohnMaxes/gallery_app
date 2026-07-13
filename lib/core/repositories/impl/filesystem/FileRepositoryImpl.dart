import 'dart:io';
import 'package:test_app/core/repositories/FileRepository.dart';

class FileRepositoryImpl implements FileRepository {
  @override
  Future<void> moveFile({required String from, required String to}) async {
    final targetFile = File(from);
    if (await targetFile.exists()) {
      final destinationFile = await File(to).create();
      final targetBytes = await targetFile.readAsBytes();
      await destinationFile.writeAsBytes(targetBytes);
      targetFile.delete();
    }
  }
}
