import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/data/counter/counter.repo.dart';
import 'package:provider/provider.dart';

class DashboardController extends ChangeNotifier {

  late BuildContext context;
  DashboardController(this.context);

  int get counter => context.watch<CounterRepo>().counter;
}
