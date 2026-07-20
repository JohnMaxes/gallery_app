enum AuthState {
  unauthenticated(0),
  user(1);

  const AuthState(this.value);
  final int value;
}
