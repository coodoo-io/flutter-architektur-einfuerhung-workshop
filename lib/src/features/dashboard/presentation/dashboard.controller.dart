import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:provider/provider.dart';

class DashboardController extends ChangeNotifier {
  late BuildContext context;
  DashboardController(this.context);

  Counter get counter => context.read<CounterRepo>().counter;
}
