import 'package:flutter_architektur_workshop/src/features/counter/data/fake.datasource.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';

class CounterRepo {
  static final CounterRepo _instance = CounterRepo._internal();

  factory CounterRepo() => _instance;

  late Counter _counter;

  CounterRepo._internal() {
    _fetchData();
  }

  Counter get counter => _counter;

  void increment() {
    _counter = _counter.copyWith(counter: _counter.counter + 1);
  }

  void _fetchData() {
    int receivedData = FakeDataSource.fetchData();
    _counter = Counter(counter: receivedData);
  }
}
