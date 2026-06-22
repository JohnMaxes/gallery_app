import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageFetchErrorDialog extends StatelessWidget {
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
