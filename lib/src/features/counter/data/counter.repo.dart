import 'package:flutter_architektur_workshop/src/features/counter/data/fake.datasource.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';

class CounterRepo {
  static final CounterRepo _instance = CounterRepo._internal();

  factory CounterRepo() => _instance;

  late Counter _counterEntity;

  CounterRepo._internal() {
    _fetchData();
  }

  Counter get counter => _counterEntity;

  void increment() {
    _counterEntity = _counterEntity.copyWith(counter: _counterEntity.counter + 1);
  }

  void _fetchData() {
    int receivedData = FakeDataSource.fetchData();
    _counterEntity = Counter(counter: receivedData);
  }
}
