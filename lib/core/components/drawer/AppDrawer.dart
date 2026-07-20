import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:test_app/core/providers/AuthProvider.dart";
import "package:test_app/features/home/view_models/GalleryViewModel.dart";
import "package:test_app/core/components/drawer/AppDrawerHeader.dart";
import "package:test_app/core/components/drawer/AppDrawerItem.dart";

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  build(BuildContext context, WidgetRef ref) {
    final galleryVM = ref.read(galleryViewModelProvider.notifier);
    final authProvider = ref.read(authProviderProvider.notifier);
    final List<({String label, IconData icon, VoidCallback onPress})>
    drawerOptions = [
      (label: "Local", icon: Icons.home, onPress: () {}),
      (
        label: "Remote",
        icon: Icons.connect_without_contact,
        onPress: () => galleryVM.addTestingImage(),
      ),
      (
        label: "Log out",
        icon: Icons.logout,
        onPress: () => authProvider.logout(),
      ),
    ];

    return Drawer(
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          AppDrawerHeader(),
          Container(
            alignment: .topStart,
            padding: EdgeInsets.all(8),
            child: Column(
              children: drawerOptions
                  .map(
                    (option) => AppDrawerItem(
                      iconData: option.icon,
                      buttonLabel: option.label,
                      onPressed: option.onPress,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
