// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appwriteAccountHash() => r'33f86434a3c7465de6ec0dc5a8bf918578accdd7';

/// See also [appwriteAccount].
@ProviderFor(appwriteAccount)
final appwriteAccountProvider = Provider<Account>.internal(
  appwriteAccount,
  name: r'appwriteAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appwriteAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppwriteAccountRef = ProviderRef<Account>;
String _$isUserLoggedInHash() => r'f0b0b621294b440744dcaf158332af98fa26cf2e';

/// See also [isUserLoggedIn].
@ProviderFor(isUserLoggedIn)
final isUserLoggedInProvider = FutureProvider<bool>.internal(
  isUserLoggedIn,
  name: r'isUserLoggedInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isUserLoggedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsUserLoggedInRef = FutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
