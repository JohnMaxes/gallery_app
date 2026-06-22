import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/domain/use_cases/GalleryUseCases.dart';
import 'package:test_app/ui/components/topbar/AppTopbar.dart';
import 'package:test_app/ui/deps_providers.dart';
import 'package:test_app/ui/model/UIGalleryImage.dart';
import 'package:test_app/ui/services/ImageRecoveryService.dart';

class GalleryState {
  const GalleryState({required this.columnCount, required this.images});

  final ColumnCount columnCount;
  final AsyncValue<List<UIGalleryImage>> images;
  int getColumnCount() => columnCount.value;

  GalleryState copyWith({
    ColumnCount? columnCount,
    AsyncValue<List<UIGalleryImage>>? images,
  }) {
    return GalleryState(
      columnCount: columnCount ?? this.columnCount,
      images: images ?? this.images,
    );
  }
}

class GalleryViewModel extends Notifier<GalleryState> {
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

  void addTestingImage() {
    _useCases.getImageByUrl(url: mockURL);
  }
}

const mockURL =
    "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_16x9.jpg?w=500";
