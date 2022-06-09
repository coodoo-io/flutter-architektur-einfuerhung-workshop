import 'package:flutter_architektur_workshop/src/features/counter/data/fake_data_source.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRepoProvider = Provider((ref) {
  return CounterRepo();
});

class CounterRepo {
  late Counter _counter;

  CounterRepo() {
    _fetchData();
  }

  Counter get counter => _counter;

  Counter increment() {
    _counter = _counter.copyWith(counter: _counter.counter + 1);
    return _counter;
  }

  void _fetchData() {
    int receivedData = FakeDataSource.fetchData();
    _counter = Counter(counter: receivedData);
  }
}
