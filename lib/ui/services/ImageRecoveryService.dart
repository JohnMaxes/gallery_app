import 'package:test_app/domain/use_cases/GalleryUseCases.dart';
import 'package:test_app/ui/model/UIGalleryImage.dart';

class ImageRecoveryService {
  ImageRecoveryService({required this._useCases});
  final GalleryUseCases _useCases;
  final Map<String, Future<void>> _inFlight = {};
  final Map<String, int> _failedAttempts = {};
  final maxAttempts = 10;

  Future<void> recover(UIGalleryImage image) {
    final existing = _inFlight[image.id];
    if (existing != null) return existing;

    final future = _recoverInternal(image);
    _inFlight[image.id] = future;
    future.whenComplete(() => _inFlight.remove(image.id));

    return future;
  }

  Future<void> _recoverInternal(UIGalleryImage image) async {
    if (image.source == .network) {
      if (image.url == null || _failedAttempts[image.id] == maxAttempts) {
        return;
      }

      final id = image.id, url = image.url;
      await _useCases.getImageByUrl(id: id, url: url!).onError((_, _) {
        _failedAttempts.update(
          image.id,
          (count) => count + 1,
          ifAbsent: () => 1,
        );
        return Future.error({});
      });
    }
  }
}
