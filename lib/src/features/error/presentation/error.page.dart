import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/login/presentation/login.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
          ],
        ),
      ),
    );
  }
}
