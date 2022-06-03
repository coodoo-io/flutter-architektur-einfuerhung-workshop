import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/app.dart';
import 'package:flutter_architektur_workshop/src/data/counter/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/presentation/counter/counter.controller.dart';
import 'package:flutter_architektur_workshop/src/presentation/dashboard/dashboard.controller.dart';
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
