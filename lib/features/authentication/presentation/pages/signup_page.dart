
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_architecture/core/general_providers.dart';
import 'package:riverpod_architecture/features/authentication/data/repository/appwrite_auth_repository.dart';

import '../../domain/handle_exceptions.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});
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
          children: [
            const Spacer(),
            const Text('RPG',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Sign up here',
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
                  final result = await authRepository.createUser(
                      emailController.text, passwordController.text);

                  switch (result) {
                    case AuthFailure():
                      print(result.message);

                    case AuthSuccess():

                      //TODO 2: Handle async nature
                      // context.router.push(const HomeRoute());
                      //Add Home route here

                      //TOPO 3: Figure out how to signup and push homeroute instead of login route, there is a timing issue somewhere.
                  }
                },
                child: const Text('Sign Up'),
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // context.router.push(const LoginRoute());
                        //Add Login route here
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
