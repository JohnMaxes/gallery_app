import "dart:io";

import "package:flutter/material.dart";
import "package:test_app/ui/model/UIGalleryImage.dart";

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.image});
  final UIGalleryImage image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          child: Image(
            image: image.imageProvider ?? FileImage(File(image.localPath)),
            errorBuilder: (context, error, stackTrace) {
              return Text(error.toString());
            },
            filterQuality: .high,
          ),
        ),
      ),
    );
  }
}
