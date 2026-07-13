import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:test_app/features/home/view_models/GalleryViewModel.dart";

enum ColumnCount {
  one(1),
  two(2),
  three(3),
  four(4);

  const ColumnCount(this.value);
  final int value;

  String get label => name[0].toUpperCase() + name.substring(1);
}

class AppTopbar extends ConsumerWidget implements PreferredSizeWidget {
  const AppTopbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final countOptions = ColumnCount.values;

    return AppBar(
      title: Text(
        "Gallery",
        style: TextStyle(color: colorScheme.onInverseSurface),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      iconTheme: IconThemeData(color: colorScheme.onInverseSurface),
      actions: [
        PopupMenuButton<ColumnCount>(
          icon: Icon(Icons.more_horiz),
          onSelected: (ColumnCount count) {
            ref
                .read(galleryViewModelProvider.notifier)
                .changeColumnCount(count);
          },
          itemBuilder: (context) => countOptions
              .map(
                (option) => PopupMenuItem<ColumnCount>(
                  value: option,
                  child: Text(option.label),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
