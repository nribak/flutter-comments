import 'package:kiwi/kiwi.dart';
import 'package:learning_flutter/exchange/data/api_provider.dart';
import 'package:learning_flutter/exchange/data/exchange_repository.dart';
import 'package:learning_flutter/exchange/data/local_storage_provider.dart';

part 'injector.g.dart';



abstract class Injector {
  static const apiDIKey = "api";
  static const storageDIKey = "storage";
  static const repositoryDIKey = "repo";

  @Register.singleton(APIProvider, name: apiDIKey)
  @Register.singleton(LocalStorageProvider, name: storageDIKey)
  @Register.factory(ExchangeRepository, name: repositoryDIKey, resolvers: {APIProvider: apiDIKey, LocalStorageProvider: storageDIKey})
  void configure();

  static void setup() => _$Injector().configure();

}