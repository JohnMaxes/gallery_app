import 'package:dio/dio.dart';
import 'package:test_app/core/repositories/NetworkRepository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  NetworkRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<void> downloadImageByUrlToPath({
    required String url,
    required String path,
  }) async => dio.downloadUri(Uri.parse(url), path);
}
