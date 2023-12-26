import 'package:kiwi/kiwi.dart';
import 'package:learning_flutter/exchange/data/exchange_repository.dart';
import 'package:learning_flutter/exchange/di/injector.dart';

class DIResolver {
  final container = KiwiContainer();

  static final DIResolver _instance = DIResolver._internal();
  DIResolver._internal();
  factory DIResolver.instance() => _instance;

  ExchangeRepository get repository => container.resolve<ExchangeRepository>(Injector.repositoryDIKey);

}