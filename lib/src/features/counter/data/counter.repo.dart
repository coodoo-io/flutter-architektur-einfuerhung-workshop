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

  Future<Counter> increment() async {
    _counter = _counter.copyWith(counter: _counter.counter + 1);
    return Future.delayed(const Duration(seconds: 1), () {
      if (_counter.counter == 4) {
        throw Exception('Danger value is 4!');
      }
      return _counter;
    });
  }

  void _fetchData() {
    int receivedData = FakeDataSource.fetchData();
    _counter = Counter(counter: receivedData);
  }
}
