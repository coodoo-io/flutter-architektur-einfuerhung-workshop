import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.entity.freezed.dart';

@freezed
class Counter with _$Counter {
  factory Counter({
    @Default(0) int counter,
  }) = _Counter;
}