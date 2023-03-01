import 'package:flutter/material.dart';
import 'package:phones_test_case/exhibit/api/exhibit_loader.dart';
import 'package:phones_test_case/exhibit/api/rest_exhibit_loader.dart';

abstract class AppModel extends ChangeNotifier {
  ExhibitsLoader get exhibitsLoader;
}

class AppModelImplementation extends AppModel {
  AppModelImplementation();

  @override
  ExhibitsLoader get exhibitsLoader => RestExhibitsLoader();
}
