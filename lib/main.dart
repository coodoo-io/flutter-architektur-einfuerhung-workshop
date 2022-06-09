import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/app.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.controller.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterRepo()),
        ChangeNotifierProvider(create: (context) => CounterController(context)),
        ChangeNotifierProvider(create: (context) => DashboardController(context))
      ],
      child: const MyApp(),
    ),
  );
}
