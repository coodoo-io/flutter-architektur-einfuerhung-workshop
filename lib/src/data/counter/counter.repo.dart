  import 'package:flutter_architektur_workshop/src/data/counter/fake_data_source.dart';
  import 'package:flutter_architektur_workshop/src/domain/counter/counter.entity.dart';

  class CounterRepo {
    static final CounterRepo _instance = CounterRepo._internal();

    factory CounterRepo() => _instance;

    late Counter counterEntity;

    CounterRepo._internal() {
      _fetchData();
    }

    int get counter => counterEntity.counter;

    void increment() {
      counterEntity = counterEntity.copyWith(counter: counterEntity.counter + 1);
    }

    void _fetchData() {
      int receivedData = FakeDataSource.fetchData();
      counterEntity = Counter(counter: receivedData);
    }
  }
