import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phones_test_case/exhibit/exhibit.dart';
import 'package:phones_test_case/exhibit/exhibit_loader.dart';

class RestExhibitsLoader extends ExhibitsLoader {
  @override
  Future<List<Exhibit>> getExhibitList() async {
    List<dynamic> jsonResponse = await _sendRequest();
    List<Exhibit> exhibitList = [];
    for (var element in jsonResponse) {
      exhibitList.add(Exhibit.fromJson(element));
    }

    return exhibitList;
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

class APIException implements Exception {
  final String _cause;
  APIException(this._cause);
  @override
  String toString() => '$runtimeType - $_cause';
}
