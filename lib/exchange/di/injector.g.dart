// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => APIProvider(), name: 'api')
      ..registerSingleton((c) => LocalStorageProvider(), name: 'storage')
      ..registerFactory(
          (c) => ExchangeRepository(
              apiProvider: c<APIProvider>('api'),
              localStorageProvider: c<LocalStorageProvider>('storage')),
          name: 'repo');
  }
}
