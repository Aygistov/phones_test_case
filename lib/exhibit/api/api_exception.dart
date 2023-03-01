class APIException implements Exception {
  final String _cause;
  APIException(this._cause);
  @override
  String toString() => '$runtimeType - $_cause';
}
