import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider = StateNotifierProvider.autoDispose<DashboardController, DashboardState>(
  (ref) => DashboardController(
    ref.watch(counterRepoProvider),
  ),
);

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController(this._counterEntity) : super(const DashboardState()){
    state = state.copyWith(counterValue: AsyncValue.data(_counterEntity));
  }

  final Counter _counterEntity;
}
