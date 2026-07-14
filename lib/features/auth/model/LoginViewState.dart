import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'LoginViewState.freezed.dart';

@freezed
abstract class LoginViewState with _$LoginViewState {
  const factory LoginViewState({
    required String username,
    required String password,
  }) = _LoginViewState;

  factory LoginViewState.empty() => LoginViewState(username: "", password: "");
}
