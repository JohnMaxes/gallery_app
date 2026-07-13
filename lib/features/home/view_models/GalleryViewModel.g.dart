// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GalleryViewModel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GalleryViewModel)
final galleryViewModelProvider = GalleryViewModelProvider._();

final class GalleryViewModelProvider
    extends $NotifierProvider<GalleryViewModel, GalleryState> {
  GalleryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'galleryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$galleryViewModelHash();

  @$internal
  @override
  GalleryViewModel create() => GalleryViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GalleryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GalleryState>(value),
    );
  }
}

String _$galleryViewModelHash() => r'ebd9777fdf65585cb1e59fc0e1a856fa24615f09';

abstract class _$GalleryViewModel extends $Notifier<GalleryState> {
  GalleryState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<GalleryState, GalleryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GalleryState, GalleryState>,
              GalleryState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
