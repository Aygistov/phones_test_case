import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phones_test_case/exhibit/api/api_exception.dart';
import 'package:phones_test_case/exhibit/models/models.dart';
import 'package:phones_test_case/exhibit/api/exhibit_loader.dart';

class RestExhibitsLoader implements ExhibitsLoader {
  @override
  Future<List<Exhibit>> getExhibitList() async {
    List<dynamic> jsonResponse = await _sendRequest();

    return jsonResponse.map((element) => Exhibit.fromJson(element)).toList();
  }
}

Future<List<dynamic>> _sendRequest() async {
  final http.Client httpClient = http.Client();
  String url = 'https://my-json-server.typicode.com/Reyst/exhibit_db/list';
  http.Response response = await httpClient.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  } else {
    throw APIException("The API threw an exception: ${response.reasonPhrase}");
  }
}
