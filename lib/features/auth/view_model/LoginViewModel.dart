import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/core/providers/AuthProvider.dart';
import 'package:test_app/features/auth/model/LoginViewState.dart';

part 'LoginViewModel.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginViewState build() {
    return LoginViewState.empty();
  }

  void performLogin() {
    if (state.username == '1' && state.password == '1') {
      debugPrint('${state.username} ${state.password}');
      final authProvider = ref.read(authProviderProvider.notifier);
      authProvider.setAuthState(.user);
    }
  }

  void setUsername(String input) => state = state.copyWith(username: input);
  void setPassword(String input) => state = state.copyWith(password: input);
}
