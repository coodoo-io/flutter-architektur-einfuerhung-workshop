import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider = ChangeNotifierProvider.autoDispose((ref) {
  return DashboardController(ref.read);
});

class DashboardController extends ChangeNotifier {
  DashboardController(this.read) {
    _counter = read(counterRepoProvider).counter;
  }
  Reader read;
  late Counter _counter;

  Counter get counter => _counter;
}
