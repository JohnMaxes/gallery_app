import "package:flutter/material.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:test_app/core/model/GalleryImage.dart";

part 'UIGalleryImage.freezed.dart';

@freezed
abstract class UIGalleryImage with _$UIGalleryImage {
  const factory UIGalleryImage({
    required String id,
    required ImageSource source,
    required String? url,
    required String localPath,
    required ImageProvider? imageProvider,
  }) = _UIGalleryImage;
}

extension DomainToUIMapper on GalleryImage {
  UIGalleryImage toUIModel() => UIGalleryImage(
    id: id,
    source: source,
    url: networkUrl,
    localPath: localPath,
    imageProvider: null,
  );
}
