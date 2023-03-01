import 'package:phones_test_case/exhibit/models/models.dart';

abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}
