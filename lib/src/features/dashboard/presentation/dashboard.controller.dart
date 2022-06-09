import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider = StateNotifierProvider.autoDispose<DashboardController, DashboardState>((ref) {
  Counter _counter = ref.read(counterRepoProvider).counter;
  return DashboardController(DashboardState(counter: _counter));
});

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController(DashboardState state) : super(state);
}
