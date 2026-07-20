import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/core/components/topbar/AppTopbar.dart';
import 'package:test_app/core/model/GalleryImage.dart';
import 'package:test_app/core/repositories/AppUseCases.dart';
import 'package:test_app/core/services/ImageRecoveryService.dart';
import 'package:test_app/features/home/models/UIGalleryImage.dart';
import 'package:test_app/features/home/view_models/GalleryViewModel.dart';
import 'mocks/getit_mocks.dart';

void main() {
  late GalleryUseCases useCase;
  late ImageRecoveryService imageRecoveryService;
  late ProviderContainer container;
  late StreamController<List<GalleryImage>> streamController;

  setUp(() async {
    await mockGetIt.reset();
    useCase = MockUseCases();
    imageRecoveryService = MockImageRecoveryService();
    streamController = StreamController();

    when(
      () => useCase.getAllImages(),
    ).thenAnswer((_) => streamController.stream);

    mockGetIt.registerSingleton<GalleryUseCases>(useCase);
    mockGetIt.registerSingleton<ImageRecoveryService>(imageRecoveryService);
  });

  tearDown(() async {
    await streamController.close();
  });

  group("GalleryViewModel test", () {
    test('Changing column count should update state correctly', () async {
      container = ProviderContainer.test();
      final GalleryViewModel galleryVM = container.read(
        galleryViewModelProvider.notifier,
      );

      final subscription = container.listen(
        galleryViewModelProvider,
        (_, _) {},
      );
      addTearDown(subscription.close);

      galleryVM.changeColumnCount(.three);

      final state = subscription.read();
      expect(state.columnCount, ColumnCount.three);
      expect(state.images, isA<AsyncValue<List<UIGalleryImage>>>());
    });

    test("Selecting the same column count shouldn't update state", () {
      container = ProviderContainer.test();
      final GalleryViewModel galleryVM = container.read(
        galleryViewModelProvider.notifier,
      );
      final subscription = container.listen(
        galleryViewModelProvider,
        (_, _) {},
      );
      addTearDown(subscription.close);

      final expectedState = subscription.read();
      galleryVM.changeColumnCount(.two);
      final actualState = subscription.read();

      expect(identical(expectedState, actualState), isTrue);
    });

    test("Adding an image should update state correctly", () async {
      final domain = GalleryImage(
        id: "random",
        source: .network,
        networkUrl: "networkURL",
        localPath: "localPath",
      );

      when(() => useCase.getImageByUrl(url: "networkURL")).thenAnswer((_) {
        streamController.add([domain]);
        return .value(domain);
      });

      container = ProviderContainer.test();
      final GalleryViewModel galleryVM = container.read(
        galleryViewModelProvider.notifier,
      );
      final subscription = container.listen(
        galleryViewModelProvider,
        (_, _) => {},
      );
      addTearDown(subscription.close);

      galleryVM.addNetworkImageByUrl("networkURL");

      await pumpEventQueue();

      verify(() => useCase.getImageByUrl(url: "networkURL")).called(1);

      final state = subscription.read();
      final images = state.images.value;
      final expected = domain.toUIModel();

      expect(state.columnCount, isA<ColumnCount>());
      expect(images, hasLength(1));
      expect(images![0].id, expected.id);
      expect(images[0].localPath, expected.localPath);
      expect(images[0].source, expected.source);
      expect(images[0].url, expected.url);
    });
  });
}
