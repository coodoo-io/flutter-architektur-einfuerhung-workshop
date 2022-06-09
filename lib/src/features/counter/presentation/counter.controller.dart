import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';

class CounterController {
  CounterRepo counterRepo = CounterRepo();

  CounterController();

  int get counter => counterRepo.counter;

  increment() => counterRepo.increment();
}
