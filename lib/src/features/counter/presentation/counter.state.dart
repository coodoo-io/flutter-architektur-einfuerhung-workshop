import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.state.freezed.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState(
      {@Default(Counter(counter: 0)) Counter counter,
      @Default(false) bool isGerade}) = _CounterState;
}
