import 'package:appwrite/models.dart';

sealed class AuthStatus {}

class AuthSuccess implements AuthStatus {
  final User user;
  AuthSuccess(this.user);
}


class AuthFailure implements AuthStatus {
  final String message;

  AuthFailure(this.message);
}
