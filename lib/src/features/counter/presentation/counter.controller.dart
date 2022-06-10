import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';

class CounterController {
  CounterRepo counterRepo = CounterRepo();

  CounterController();

  Counter get counter => counterRepo.counter;

  increment() => counterRepo.increment();
}
