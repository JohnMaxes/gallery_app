import 'package:go_router/go_router.dart';
import 'package:test_app/app/GalleryApp.dart';
import 'package:test_app/features/home/models/UIGalleryImage.dart';
import 'package:test_app/features/capture/views/CaptureScreen.dart';
import 'package:test_app/features/image/views/ImageScreen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(name: 'home', path: '/', builder: (_, _) => const GalleryAppContent()),
    GoRoute(
      name: 'imageDetails',
      path: '/image/:id',
      builder: (context, state) {
        final image = state.extra as UIGalleryImage;
        return ImageScreen(image: image);
      },
    ),
    GoRoute(
      name: 'capture',
      path: '/capture',
      builder: (_, _) => const CaptureScreen(),
    ),
  ],
);