// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginViewModel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginViewModel)
final loginViewModelProvider = LoginViewModelProvider._();

final class LoginViewModelProvider
    extends $NotifierProvider<LoginViewModel, LoginViewState> {
  LoginViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginViewModelHash();

  @$internal
  @override
  LoginViewModel create() => LoginViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginViewState>(value),
    );
  }
}

String _$loginViewModelHash() => r'd925d1d65b88826ba121e0be99aa154e13bb8536';

abstract class _$LoginViewModel extends $Notifier<LoginViewState> {
  LoginViewState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LoginViewState, LoginViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginViewState, LoginViewState>,
              LoginViewState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
