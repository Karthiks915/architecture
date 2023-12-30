
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(),
    );
  }
}






// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: double.infinity,
//           ),
//           Text('Home Page'),
//           ElevatedButton(
//               onPressed: () async {
//                 await ref.watch(authRepositoryProvider).logoutUser();

//                 context.router.replace(const LoginRoute());
//               },
//               child: Text('Logout')),
//           SizedBox(
//             height: 30,
//           ),
//           TextButton(
//             onPressed: () {
//               GptRepository().chat('What is my name?');
//             },
//             child: const Text('Print GPT Response'),
//           ),
//         ],
//       ),