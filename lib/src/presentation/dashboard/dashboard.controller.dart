import 'package:flutter_architektur_workshop/src/data/counter/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/domain/counter/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider = StateNotifierProvider.autoDispose<DashboardController, void>(
  (ref) => DashboardController(
    ref.watch(counterRepoProvider),
  ),
);

class DashboardController extends StateNotifier {
  DashboardController(this._counterEntity) : super(null);
  final Counter _counterEntity;

  int get counter => _counterEntity.counter;
}
