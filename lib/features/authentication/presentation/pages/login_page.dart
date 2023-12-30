
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_architecture/core/general_providers.dart';
import 'package:riverpod_architecture/features/authentication/data/repository/appwrite_auth_repository.dart';
import 'package:riverpod_architecture/features/authentication/domain/handle_exceptions.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = useTextEditingController();
    TextEditingController passwordController = useTextEditingController();
    final authRepository = ref.watch(authRepositoryProvider);
    final appwriteAccount = ref.watch(appwriteAccountProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('RPG',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Log into your account here',
                style: TextStyle(
                  fontSize: 16,
                )),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () async {
                  final result = await authRepository.loginUser(
                      emailController.text, passwordController.text);

                  print(result);

                  switch (result) {
                    case AuthSuccess():
                      // context.router.push(const HomeRoute());
                      //Add Home route here
                      break;
                      //TODO 1: Handle async nature
                    case AuthFailure():
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('test'),
                        ),
                      );
                      break;
                    default:
                  }
                },
                child: const Text('Log In'),
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Signup',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        try {
                          // context.router.push(const SignUpRoute());
                          //Add Signup route here
                        } catch (e) {
                          print('Navigation error: $e');
                        }
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
