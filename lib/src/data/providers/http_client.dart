import 'dart:convert';

import 'package:comments_app/src/utils/extensions.dart';
import 'package:http/http.dart'  show Client, Request;

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


class HTTPClientResponse<T> {
  final dynamic _raw;
  final int responseCode;

  HTTPClientResponse({required this.responseCode, required dynamic raw}) : _raw = raw;

  bool isSuccess() => responseCode < 400;

  R asObject<R>(R Function(Map<String, dynamic> raw) mapper) => mapper(_raw);

  List<R> asList<R>(R Function(Map<String, dynamic> raw) mapper) => (_raw as List<dynamic>).fixedListMap((el) => mapper(el));
}

class HTTPClient {
  final client = Client();
  final String baseUrl;
  final String apiKey;

  HTTPClient({required this.baseUrl, required this.apiKey});


  Future<HTTPClientResponse<R>> execute<R> (HTTPClientRequest request) async {
    final url = Uri.https(baseUrl, request.path, request.urlParams);
    final Request req  = Request(request.method.name, url);
    req.headers.addAll({'api-key': apiKey});
    if(request.body != null) {
      req.headers.addAll({'Content-Type': 'application/json'});
      req.body = jsonEncode(request.body);
    }

    try {
      final res = await client.send(req);
      final json = await res.stream.bytesToString();
      final raw = jsonDecode(json);
      return HTTPClientResponse(responseCode: res.statusCode, raw: raw);
    } on Exception catch(e) {
      print(jsonEncode(e));
      return HTTPClientResponse(responseCode: 500, raw: null);
    }
  }


}