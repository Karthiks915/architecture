import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture/core/general_providers.dart';
import 'package:riverpod_architecture/features/authentication/domain/handle_exceptions.dart';
import 'package:riverpod_architecture/features/authentication/domain/repository/auth_repository.dart';

part 'appwrite_auth_repository.g.dart';

class AppwriteAuthRepository implements AuthRepository {
  final Account _account;

  AppwriteAuthRepository(this._account);

  @override
  Future<AuthStatus> createUser(String email, String password) async {
    try {
      // Assuming Appwrite SDK has a create method on the Account object

      final result = await _account.create(
        email: email,
        password: password,
        userId: ID.unique(),
      );

      await _account.createEmailSession(email: email, password: password);

      // Convert the result to your User domain model
      // final user = User.fromAppwriteModel(result);
      return AuthSuccess(result);
    } on AppwriteException catch (e) {
      // Handle the specific Appwrite exception here
      return AuthFailure(e.message!);
    } catch (e) {
      // Handle any other kind of exception here
      return AuthFailure(e.toString());
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await _account.deleteSessions();
    } catch (e) {
      rethrow; // You might want to handle this more gracefully
    }
  }

  @override
  Future<AuthStatus> loginUser(String email, String password) async {
    try {
      await _account.createEmailSession(
        email: email,
        password: password,
      );
      final user = await _account.get();

      // Return AuthSuccess with the user object
      return AuthSuccess(user);
    } catch (e) {
      rethrow; // You might want to handle this more gracefully
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      // await _account.delete();
    } catch (e) {
      rethrow; // You might want to handle this more gracefully
    }
  }

  @override
  Future<User> updateUser(String userId,
      {String? email, String? password}) async {
    try {
      // Update user email and password. This might need more specific methods from Appwrite SDK
      // You might need to call different SDK methods if you're updating different user fields
      // For now, let's assume we're updating email and password
      if (email != null) {
        // await _account.updateEmail(email: email);
      }
      if (password != null) {
        await _account.updatePassword(password: password);
      }
      return await _account.get();
    } catch (e) {
      rethrow; // You might want to handle this more gracefully
    }
  }

  @override
  Future<User> getUserData() async {
    try {
      return await _account.get();
    } catch (e) {
      rethrow; // You might want to handle this more gracefully
    }
  }
}

//Returns AppwriteAuthRepository as a provider

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AppwriteAuthRepository(ref.watch(appwriteAccountProvider));
}
