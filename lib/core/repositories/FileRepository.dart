abstract interface class FileRepository {
  Future<void> moveFile({required String from, required String to});
}
