class APIException implements Exception {
  APIException(this._cause);

  final String _cause;

  @override
  String toString() => '$runtimeType - $_cause';
}
