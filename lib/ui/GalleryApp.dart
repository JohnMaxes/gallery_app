import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/domain/model/GalleryImage.dart';
import 'package:test_app/ui/components/popup/ImageFetchErrorDialog.dart';
import 'package:test_app/ui/deps_providers.dart';
import 'package:test_app/ui/util/GalleryModal.dart';
import 'package:test_app/ui/components/drawer/AppDrawer.dart';
import 'package:test_app/ui/components/popup/AddImageDialog.dart';
import 'package:test_app/ui/components/popup/ImageURLInputDialog.dart';
import 'package:test_app/ui/components/topbar/AppTopbar.dart';
import 'package:test_app/ui/model/UIGalleryImage.dart';
import 'package:test_app/ui/screens/CaptureScreen.dart';
import 'package:test_app/ui/screens/GridScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/ui/screens/ImageScreen.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
    );
  }
}

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => GalleryAppContent()),
    GoRoute(
      path: '/image/:id',
      builder: (context, state) {
        final image = state.extra as UIGalleryImage;
        return ImageScreen(image: image);
      },
    ),
    GoRoute(
      path: '/capture',
      builder: (context, state) {
        return CaptureScreen();
      },
    ),
  ],
);

class GalleryAppContent extends ConsumerWidget {
  const GalleryAppContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryVM = ref.read(galleryViewModelProvider.notifier);

    return Scaffold(
      appBar: AppTopbar(),
      body: GridScreen(),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final choice = await GalleryModalUtil.showAppDialog<ImageSource>(
            context: context,
            builder: AddImageDialog().build,
          );

          if (!context.mounted) {
            debugPrint("context not mounted??");
          } else if (choice == .local) {
            context.push("/capture");
          } else if (choice == .network) {
            final networkImgURL = await GalleryModalUtil.showAppDialog<String>(
              context: context,
              builder: ImageURLInputDialog().builder,
            );
            if (networkImgURL != null && context.mounted) {
              galleryVM.addNetworkImageByUrl(networkImgURL).onError((_, _) {
                GalleryModalUtil.showAppDialog(
                  context: context,
                  builder: ImageFetchErrorDialog().build,
                );
              });
            }
          }
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
