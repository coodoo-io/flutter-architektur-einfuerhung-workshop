import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider = StateNotifierProvider<DashboardController, void>(
  (ref) => DashboardController(
    Counter(counter: ref.watch(counterRepoProvider).counter),
  ),
);

class DashboardController extends StateNotifier {
  DashboardController(this._counterEntity) : super(null);
  final Counter _counterEntity;

  int get counter => _counterEntity.counter;
}
