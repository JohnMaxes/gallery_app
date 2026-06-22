import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/ui/model/UIGalleryImage.dart';

class GalleryGridItem extends StatelessWidget {
  const GalleryGridItem({super.key, required this.image, this.onImageError});
  final UIGalleryImage image;
  final void Function(UIGalleryImage)? onImageError;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/image/${image.id}', extra: image),
      child: SizedBox.expand(
        child: Image.file(
          File(image.localPath),
          fit: BoxFit.cover,
          cacheWidth: 500,
          filterQuality: FilterQuality.low,
          errorBuilder: (context, error, stackTrace) {
            onImageError?.call(image);
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
