import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/app/GalleryApp.dart';
import 'package:test_app/core/providers/AuthProvider.dart';
import 'package:test_app/features/auth/views/LoginScreen.dart';
import 'package:test_app/features/home/models/UIGalleryImage.dart';
import 'package:test_app/features/capture/views/CaptureScreen.dart';
import 'package:test_app/features/image/views/ImageScreen.dart';

part 'AppRouter.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authNotifier = ref.read(authProviderProvider.notifier);

  final router = GoRouter(
    initialLocation: '/',
    refreshListenable: authNotifier.listenable,
    redirect: (context, state) {
      final authState = ref.read(authProviderProvider);
      final isLoggedIn = authState == .user;
      final isOnLoginPage = state.matchedLocation == '/login';
      if (!isLoggedIn && !isOnLoginPage) {
        return state.namedLocation('login');
      }
      if (isLoggedIn && isOnLoginPage) {
        return state.namedLocation('home');
      }
      return null;
    },
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (_, _) => const LoginScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/',
        builder: (_, _) => const GalleryAppContent(),
      ),
      GoRoute(
        name: 'imageDetails',
        path: '/image/:id',
        builder: (context, state) {
          final image = state.extra as UIGalleryImage;
          return ImageScreen(image: image);
        },
      ),
      GoRoute(
        name: 'captureScreen',
        path: '/capture',
        builder: (_, _) => const CaptureScreen(),
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
}
