import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client, Request;

enum HTTPRequestMethod {
  get, post
}

class HTTPClientRequest {
  final String path;
  final HTTPRequestMethod method;
  final Object? body;
  final Map<String, dynamic>? urlParams;

  HTTPClientRequest({required this.path, required this.method, this.body, this.urlParams});
}

class HTTPClientResponse {
  final int responseCode;
  final Stream<dynamic> stream;
  HTTPClientResponse({required this.responseCode, required this.stream});

  Future<R> parseObject<R>(R Function(Map<String, dynamic> map) mapper) async {
    final object = await stream.first;
    return mapper(object);
  }

  Future<Iterable<R>> parseList<R>(R Function(Map<String, dynamic> map) mapper) async {
    final list = await stream.first.then((value) => value as Iterable<dynamic>);
    return list.map((el) => mapper(el));
  }

  bool isSuccess() => responseCode < 400;
}

class AppHTTPClient {
  final client = Client();
  final String baseUrl;
  final String apiKey;

  AppHTTPClient({required this.baseUrl, required this.apiKey});



  Future<HTTPClientResponse> execute (HTTPClientRequest request) async {
    final url = Uri.https(baseUrl, request.path, request.urlParams);
    final Request req  = Request(request.method.name, url);
    req.headers.addAll({'api-key': apiKey});
    if(request.body != null) {
      req.headers.addAll({'Content-Type': 'application/json'});
      req.body = jsonEncode(request.body);
    }
    final res = await client.send(req);
    final stream = res.stream
        .transform(utf8.decoder)
        .transform(json.decoder);

    return HTTPClientResponse(responseCode: res.statusCode, stream: stream);
  }
}