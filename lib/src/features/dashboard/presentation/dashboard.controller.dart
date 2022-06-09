import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider = ChangeNotifierProvider((ref) {
  return DashboardController(Counter(counter: ref.watch(counterRepoProvider).counter));
});

class DashboardController extends ChangeNotifier {

  late Counter _counter;
  DashboardController(this._counter);

  int get counter => _counter.counter;
}

