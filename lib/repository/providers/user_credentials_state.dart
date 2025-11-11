class UserCredentialsState {
  final String email;
  final String password;
  final bool isLoggedIn;

  UserCredentialsState({
    this.email = '',
    this.password = '',
    this.isLoggedIn = false,
  });

  UserCredentialsState copyWith({
    String? email,
    String? password,
    bool? isLoggedIn,
  }) {
    return UserCredentialsState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
