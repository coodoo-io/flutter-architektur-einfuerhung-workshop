import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';

class DashboardController {
  CounterRepo counterRepo = CounterRepo();

  DashboardController();

  int get counter => counterRepo.counter;
}
