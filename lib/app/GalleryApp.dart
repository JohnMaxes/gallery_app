import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/app/AppRouter.dart';
import 'package:test_app/core/components/popup/AddImageDialog.dart';
import 'package:test_app/core/components/popup/ImageFetchErrorDialog.dart';
import 'package:test_app/core/components/popup/ImageURLInputDialog.dart';
import 'package:test_app/core/model/GalleryImage.dart';
import 'package:test_app/features/home/view_models/GalleryViewModel.dart';
import 'package:test_app/core/utils/GalleryModal.dart';
import 'package:test_app/core/components/drawer/AppDrawer.dart';
import 'package:test_app/core/components/topbar/AppTopbar.dart';
import 'package:test_app/features/home/views/GridScreen.dart';
import 'package:go_router/go_router.dart';

class GalleryApp extends ConsumerWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(appRouterProvider),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
    );
  }
}

class GalleryAppContent extends ConsumerWidget {
  const GalleryAppContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryVM = ref.read(galleryViewModelProvider.notifier);

    return Scaffold(
      appBar: const AppTopbar(),
      body: const GridScreen(),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final choice = await GalleryModalUtil.showAppDialog<ImageSource>(
            context: context,
            builder: const AddImageDialog().build,
          );

          if (!context.mounted) {
            debugPrint("context not mounted??");
          } else if (choice == .local) {
            context.push("/capture");
          } else if (choice == .network) {
            final networkImgURL = await GalleryModalUtil.showAppDialog<String>(
              context: context,
              builder: const ImageURLInputDialog().builder,
            );
            if (networkImgURL != null && context.mounted) {
              galleryVM.addNetworkImageByUrl(networkImgURL).onError((_, _) {
                GalleryModalUtil.showAppDialog(
                  context: context,
                  builder: const ImageFetchErrorDialog().build,
                );
              });
            }
          }
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
