import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phones_test_case/app_model.dart';
import 'package:phones_test_case/exhibit/view/exhibit_view.dart';

void main() {
  GetIt.instance.registerSingleton<AppModel>(AppModelImplementation(),
      signalsReady: true);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExhibitListView(),
    );
  }
}
