import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:learning_flutter/exchange/data/api_provider.dart';
import 'package:learning_flutter/exchange/data/local_storage_provider.dart';
import 'package:learning_flutter/exchange/data/models.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class ExchangeRepository {
  final APIProvider apiProvider;
  final LocalStorageProvider localStorageProvider;

  ExchangeRepository({required this.apiProvider, required this.localStorageProvider});

  void _cacheItems(CurrentCurrencies event) {
    for (var element in event.currencies) {
        localStorageProvider.insert(event.timestamp, element);
    }
  }

  Stream<CurrentCurrencies> listenForCurrenciesEvery(int seconds, bool Function() isActiveCallback) {
    return apiProvider
        .listenForCurrencies(seconds, isActiveCallback)
        .transform(DoStreamTransformer(onData: _cacheItems));
  }

  Stream<Currency> getHistoryCurrencies(String key) {
    return localStorageProvider.getCurrencyByKey(key);
  }
}