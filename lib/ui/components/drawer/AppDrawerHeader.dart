import "package:flutter/material.dart";

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({super.key});

  @override
  build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onInverseSurface;

    return DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Container(
        alignment: .topStart,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text("User", style: TextStyle(color: textColor)),
            Text("user@hitachivantara.com", style: TextStyle(color: textColor)),
          ],
        ),
      ),
    );
  }
}
