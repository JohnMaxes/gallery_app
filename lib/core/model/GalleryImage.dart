enum ImageSource { local, network }

class GalleryImage {
  const GalleryImage({
    required this.id,
    required this.source,
    this.networkUrl,
    required this.localPath,
  });

  final String id;
  final ImageSource source;
  final String? networkUrl;
  final String localPath;
}
