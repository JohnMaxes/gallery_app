import "package:flutter/material.dart";
import "package:test_app/domain/model/GalleryImage.dart";

class UIGalleryImage {
  const UIGalleryImage({
    required this.id,
    required this.source,
    required this.url,
    required this.localPath,
    required this.imageProvider,
  });

  final String id;
  final ImageSource source;
  final String localPath;
  final String? url;
  final ImageProvider? imageProvider;
}

extension DomainToUIMapper on GalleryImage {
  UIGalleryImage toUIModel() {
    return UIGalleryImage(
      id: id,
      source: source,
      url: networkUrl,
      localPath: localPath,
      imageProvider: null,
    );
  }
}
