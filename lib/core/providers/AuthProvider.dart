import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/core/model/AuthState.dart';

part 'AuthProvider.g.dart';

@Riverpod(keepAlive: true)
class AuthProvider extends _$AuthProvider {
  @override
  AuthState build() {
    return .unauthenticated;
  }

  AuthListenable listenable = AuthListenable();
  void login() => setAuthState(.user);
  void logout() => setAuthState(.unauthenticated);

  void setAuthState(AuthState newState) {
    state = newState;
    listenable.refresh();
  }
}

class AuthListenable with ChangeNotifier {
  void refresh() => notifyListeners();
}
