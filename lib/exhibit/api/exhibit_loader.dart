

import 'package:phones_test_case/exhibit/models/exhibit.dart';

abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}
