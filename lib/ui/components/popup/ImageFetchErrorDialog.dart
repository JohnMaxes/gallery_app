import 'package:flutter/material.dart';

class ImageFetchErrorDialog extends StatelessWidget {
  const ImageFetchErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Invalid URL"),
      content: Text(
        "Failed to fetch image at URL! \nCheck the URL again.",
        textAlign: .center,
      ),
    );
  }
}
