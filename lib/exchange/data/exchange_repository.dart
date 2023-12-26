import 'dart:async';

import 'package:learning_flutter/exchange/data/api_provider.dart';
import 'package:learning_flutter/exchange/data/local_storage_provider.dart';
import 'package:learning_flutter/exchange/data/models.dart';
import 'package:rxdart/rxdart.dart';

class ExchangeRepository {
  final APIProvider apiProvider;
  final LocalStorageProvider localStorageProvider;

  ExchangeRepository({required this.apiProvider, required this.localStorageProvider});

  void _cacheItems(CurrentCurrencies event) {
    for (var element in event.currencies) {
        localStorageProvider.insert(event.timestamp, element);
    }
  }

  Stream<CurrentCurrencies> listenForCurrenciesEvery(int seconds, bool Function() callback) {
    return apiProvider
        .listenForCurrencies(seconds, callback)
        .transform(DoStreamTransformer(onData: _cacheItems));
  }


}