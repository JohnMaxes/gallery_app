abstract interface class NetworkRepository {
  Future<void> downloadImageByUrlToPath({
    required String url,
    required String path,
  });
}
