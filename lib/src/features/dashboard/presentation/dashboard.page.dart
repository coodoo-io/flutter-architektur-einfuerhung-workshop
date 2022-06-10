import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController dashboardController = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'The Button has been triggered ',
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: [
              TextSpan(
                text: '${dashboardController.counter.counter}',
                style: const TextStyle(fontSize: 60, color: Colors.blue),
              ),
              const TextSpan(text: ' times.'),
            ],
          ),
        ),
      ),
    );
  }
}
