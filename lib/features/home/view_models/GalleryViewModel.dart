import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/core/repositories/AppUseCases.dart';
import 'package:test_app/core/components/topbar/AppTopbar.dart';
import 'package:test_app/core/providers/deps_providers.dart';
import 'package:test_app/features/home/view_models/GalleryState.dart';
import 'package:test_app/features/home/models/UIGalleryImage.dart';
import 'package:test_app/core/services/ImageRecoveryService.dart';

part 'GalleryViewModel.g.dart';

@riverpod
class GalleryViewModel extends _$GalleryViewModel {
  late final GalleryUseCases _useCases;
  late final ImageRecoveryService _imageRecoveryService;

  @override
  GalleryState build() {
    _useCases = getIt();
    _imageRecoveryService = getIt();

    final imageStreamSubscriber = _useCases.getAllImages().listen((images) {
      final toUI = images.map((image) => image.toUIModel()).toList();
      state = state.copyWith(images: AsyncValue.data(toUI));
    });
    ref.onDispose(imageStreamSubscriber.cancel);

    return const GalleryState(
      images: AsyncValue.loading(),
      columnCount: ColumnCount.two,
    );
  }

  void changeColumnCount(ColumnCount count) {
    if (state.columnCount != count) {
      state = state.copyWith(columnCount: count);
    }
  }

  Future<void> addNetworkImageByUrl(String url) =>
      _useCases.getImageByUrl(url: url);
  Future<void> addLocalImageByPath(String path) =>
      _useCases.saveLocalImage(localPath: path);

  void recoverImage(UIGalleryImage image) =>
      _imageRecoveryService.recover(image);

  void addTestingImage() => _useCases.getImageByUrl(url: mockURL);
}

const mockURL =
    "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_16x9.jpg?w=500";
