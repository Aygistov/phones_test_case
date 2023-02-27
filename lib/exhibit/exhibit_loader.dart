import 'package:phones_test_case/exhibit/exhibit.dart';

abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}
