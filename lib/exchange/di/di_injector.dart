import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_flutter/exchange/di/di_injector.config.dart';

import '../data/exchange_repository.dart';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => GetIt.instance.init();


class Injector {
  final _getIt = GetIt.instance;



  Injector._internal();
  static final _instance = Injector._internal();
  factory Injector.instance() => _instance;

  ExchangeRepository get repository => _getIt<ExchangeRepository>();
}