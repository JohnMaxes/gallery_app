import "package:flutter/material.dart";

class AppDrawerItem extends StatelessWidget {
  const AppDrawerItem({
    super.key,
    required this.iconData,
    required this.buttonLabel,
    required this.onPressed,
  });
  final IconData iconData;
  final String buttonLabel;
  final Color itemColor = const Color.fromARGB(255, 126, 126, 126);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(iconData, color: itemColor),
          Spacer(),
          Expanded(
            flex: 7,
            child: Text(buttonLabel, style: TextStyle(color: itemColor)),
          ),
        ],
      ),
    );
  }
}
