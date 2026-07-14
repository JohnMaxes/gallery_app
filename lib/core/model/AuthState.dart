enum AuthState {
  unauthenticated(0),
  loggedOn(1);

  const AuthState(this.value);
  final int value;
}
