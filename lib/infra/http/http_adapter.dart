import 'dart:convert';
import 'package:http/http.dart';
import '../../data/http/http.dart';

class HttpAuthorizedAdapter implements HttpClient {
  final HttpAdapter httpAdapter;

  HttpAuthorizedAdapter({
    required this.httpAdapter,
  });

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map<String, String>? headers,
  }) async {
    const String token = 'k321n58n13nj1';

    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return httpAdapter.request(
        url: url, method: method, body: body, headers: headers);
  }
}

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter({required this.client});

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map<String, String>? headers,
  }) async {
    final defaultHeaders = headers ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': '*/*',
      });

    final jsonBody = body != null ? jsonEncode(body) : null;

    Response response = Response('', 500);
    late Future<Response>? futureResponse;

    try {
      switch (method) {
        case 'post':
          futureResponse = client.post(Uri.parse(url),
              headers: defaultHeaders, body: jsonBody);
          break;
        case 'get':
          futureResponse = client.get(Uri.parse(url), headers: defaultHeaders);
          break;
        case 'put':
          futureResponse = client.put(Uri.parse(url),
              headers: defaultHeaders, body: jsonBody);
          break;
      }

      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (error) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? {} : jsonDecode(response.body);
      case 201:
        return response.body.isEmpty ? {} : jsonDecode(response.body);
      case 204:
        return {};
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
