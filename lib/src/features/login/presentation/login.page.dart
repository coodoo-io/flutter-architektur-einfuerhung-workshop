import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/login/presentation/login.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loginControllerProvider);
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Looks like you're not logged in. Let's change that."),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(loginControllerProvider.notifier).login(
                            'myEmail',
                            'myPassword',
                          );
                    },
                    child: const Text('Login')),
                Container(
                  child: loading is AsyncLoading
                      ? const CircularProgressIndicator(
                          strokeWidth: 2.0,
                        )
                      : loading is AsyncError
                          ? Text((loading as AsyncError).error.toString())
                          : const Text(''),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
