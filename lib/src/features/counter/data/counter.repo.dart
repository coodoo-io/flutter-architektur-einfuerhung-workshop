import 'package:flutter/foundation.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/fake_data_source.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRepoProvider = ChangeNotifierProvider((ref){
  return CounterRepo();
});

class CounterRepo extends ChangeNotifier {
  late Counter _counterEntity;

  CounterRepo() {
    _fetchData();
  }

  int get counter => _counterEntity.counter;

  void increment() {
    _counterEntity = _counterEntity.copyWith(counter: _counterEntity.counter + 1);
    notifyListeners();
  }

  void _fetchData() {
    int receivedData = FakeDataSource.fetchData();
    _counterEntity = Counter(counter: receivedData);
    notifyListeners();
  }
}
