import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/features/home/view_models/GalleryViewModel.dart';

class CaptureScreen extends ConsumerStatefulWidget {
  const CaptureScreen({super.key});

  @override
  ConsumerState<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends ConsumerState<CaptureScreen> {
  CameraController? _controller;
  Future<void>? _initializeCameraFuture;

  @override
  void initState() {
    super.initState();
    _initializeCameraFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw Exception('No cameras available');
    }
    final backCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );

    final controller = CameraController(
      backCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _controller = controller;

    await controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _takePicture(Future<void> Function(String) callback) async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }
    final XFile photo = await controller.takePicture();
    if (!mounted) return;
    debugPrint("GALLERY PHOTO PATH: ${photo.path.toString()}");
    callback(photo.path.toString()).then((_) => context.pop());
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final galleryVM = ref.read(galleryViewModelProvider.notifier);
    Future<void> takePictureCallback(String path) =>
        galleryVM.addLocalImageByPath(path);

    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeCameraFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(child: Text('Camera error: ${snapshot.error}')),
            );
          }

          final controller = _controller;

          if (controller == null || !controller.value.isInitialized) {
            return const Center(child: Text('Camera is not ready'));
          }

          return Stack(
            children: [
              Positioned.fill(child: CameraPreview(controller)),

              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),
              ),

              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: FloatingActionButton.large(
                      onPressed: () => _takePicture(takePictureCallback),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.camera_alt),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
