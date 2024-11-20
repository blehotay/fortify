import 'dart:async';

import 'package:http/http.dart' as http;

/// A typedef representing a function that performs an HTTP GET request.
///
/// This typedef can be used to pass around functions that match this signature,
/// allowing for flexibility in testing, mocking, or substituting HTTP GET
/// requests.

typedef GetCall = Future<http.Response> Function(
  Uri, {
  Map<String, String>? headers,
});

// typedef ResponseHandler = FutureOr<http.Response> Function(
//   http.Response response,
// );

// class ApiClientError implements Exception {
//   ApiClientError(this.cause, this.statusCode);

//   ApiClientError.fromResponse(http.Response response)
//       : statusCode = response.statusCode,
//         cause = 'Request to ${response.request?.url}  '
//         'failed with status code ${response.statusCode} code/n'
//         '\n'
//         'Body:\n'
//         '${response.body}'
//         ;

//   final dynamic cause;
//   final int statusCode;

//   @override
//   String toString() => cause.toString();
// }

/// {@template api_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({
    required String baseUrl,
    // required ApiConfig apiConfig,
    GetCall? getCall,
  })  : _base = Uri.parse(baseUrl),
        _get = getCall ?? http.get;

  final Uri _base;
  final GetCall _get;

  Map<String, String> get _headers => {
        // if (_idToken != null) 'Authorization': 'Bearer $_idToken',
        // if (_appCheckToken != null) 'X-Firebase-AppCheck': _appCheckToken!,
        'Authorization': 'Bearer _idToken',
        'X-Firebase-AppCheck': '_appCheckToken',
      };

  /// Sends a GET request to the specified [path].
  Future<http.Response> get(
    String path, {
    Map<String, String>? queryParameters,
  }) async {
    return _handleUnauthorized(() async {
      final response = await _get(
        _base.replace(
          path: path,
          queryParameters: queryParameters,
        ),
        headers: _headers,
      );

      return response;
    });
  }

  Future<http.Response> _handleUnauthorized(
    Future<http.Response> Function() sendRequest,
  ) async {
    final response = await sendRequest();

    // if (response.statusCode == HttpStatus.unauthorized) {
    //   _idToken = await _refreshIdToken();
    //   return sendRequest();
    // }
    return response;
  }
}
