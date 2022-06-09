import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider = StateNotifierProvider.autoDispose<DashboardController, DashboardState>((ref) {
  return DashboardController(const DashboardState(), ref.read);
});

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController(DashboardState state, this.read) : super(state) {
    print("dashboardController");
    Counter _counter = read(counterRepoProvider).counter;
    state = state.copyWith(counter: AsyncValue.data(_counter));
  }

  Reader read;
}
