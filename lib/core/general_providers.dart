import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'general_providers.g.dart';

//Get Appwrite account

@Riverpod(keepAlive: true)
Account appwriteAccount(AppwriteAccountRef ref) {
  Client client = Client()
      .setEndpoint('YOUR_ENDPOINT')
      .setProject('YOUR_PROJECT_ID')
      .setSelfSigned();

  return Account(client);
}

//Get User logged in status

@Riverpod(keepAlive: true)
Future<bool> isUserLoggedIn(IsUserLoggedInRef ref) async {
  final account = ref.watch(appwriteAccountProvider);

  try {
    await account.get();
    return true; // User is logged in
  } on AppwriteException catch (e) {
    print("Error: ${e.message}");
    return false; // User is not logged in or session expired
  }
}
