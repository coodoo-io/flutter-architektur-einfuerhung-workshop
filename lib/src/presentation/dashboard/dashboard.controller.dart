import 'package:flutter_architektur_workshop/src/data/counter/counter.repo.dart';

class DashboardController {
  CounterRepo counterRepo = CounterRepo();

  DashboardController();

  int get counter => counterRepo.counter;
}
