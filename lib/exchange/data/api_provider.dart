import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client, Request;
import 'package:learning_flutter/exchange/data/models.dart';

const url = "https://sample-comments-service-5y6owysdhq-uc.a.run.app/fx/current";
const apiKey = "795cfec4-68b1-42d6-baa0-16a53ce09a1d";

class APIProvider {
  final _client = Client();

  Stream<CurrentCurrencies> listenForCurrencies(int interval, bool Function() isActive) async* {

    while(isActive()) {
      final req = Request('GET', Uri.parse(url));
      req.headers.addAll({'api-key': apiKey});
      final res = await _client.send(req);
      if(res.statusCode < 400) {
        String json = await utf8.decodeStream(res.stream);
        Map<String, dynamic> map = jsonDecode(json);
        yield CurrentCurrencies.fromMap(map);
      }
      await Future.delayed(Duration(seconds: interval));
    }
  }

}