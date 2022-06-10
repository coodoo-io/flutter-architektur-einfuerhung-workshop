import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';

class DashboardController {
  CounterRepo counterRepo = CounterRepo();

  DashboardController();

  Counter get counter => counterRepo.counter;
}
