
import 'package:appwrite/models.dart';
import 'package:riverpod_architecture/features/authentication/domain/handle_exceptions.dart';

abstract class AuthRepository {
  Future<AuthStatus> createUser(String email, String password);
  Future<void> logoutUser();
  Future<AuthStatus> loginUser(String email, String password);
  Future<void> deleteUser();
  Future<User> updateUser(String userId, {String? email, String? password});
  Future<User> getUserData();
}

