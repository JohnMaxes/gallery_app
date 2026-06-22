import 'package:flutter/material.dart';

class ImageURLInputDialog extends StatefulWidget {
  const ImageURLInputDialog({super.key});

  Widget builder(BuildContext context) => const ImageURLInputDialog();

  @override
  State<StatefulWidget> createState() => ImageURLInputDialogState();
}

class ImageURLInputDialogState extends State<ImageURLInputDialog> {
  final inputController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      final content = inputController.text;
      if (content.isNotEmpty) {
        Navigator.of(context).pop(content);
      }
    }

    return Dialog(
      child: Container(
        padding: .all(24),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          spacing: 4,
          children: [
            Text(
              "Paste URL of desired image here:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(
              controller: inputController,
              focusNode: focusNode,
              decoration: const InputDecoration(
                hintText: "https://example.com/image.png",
              ),
              onSubmitted: (_) => onSubmit(),
            ),
            Row(
              mainAxisAlignment: .end,
              children: [
                FilledButton(onPressed: () => onSubmit(), child: Text("Add")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
