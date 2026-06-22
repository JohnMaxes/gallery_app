import 'package:flutter/material.dart';
import 'package:test_app/domain/model/GalleryImage.dart';

class AddImageDialog extends StatelessWidget {
  const AddImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Image'),
      content: const Text('Where do you want to add the image from?'),
      actionsAlignment: .spaceEvenly,
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(context).pop(ImageSource.local),
          child: const Row(
            spacing: 8,
            mainAxisSize: .min,
            children: [Icon(Icons.camera), Text("Camera")],
          ),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(ImageSource.network),
          child: const Row(
            spacing: 8,
            mainAxisSize: .min,
            children: [Icon(Icons.network_wifi), Text("Network")],
          ),
        ),
      ],
    );
  }
}
