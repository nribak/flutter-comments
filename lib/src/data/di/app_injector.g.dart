// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$AppInjector extends AppInjector {
  @override
  void development() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<CommentsProvider>((c) => LoopbackAPIProvider(),
          name: 'comments_provider')
      ..registerFactory(
          (c) => CommentsRepository(
              apiProvider: c<CommentsProvider>('comments_provider')),
          name: 'repository');
  }

  @override
  void production() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<CommentsProvider>((c) => CommentsAPIProvider(),
          name: 'comments_provider')
      ..registerFactory(
          (c) => CommentsRepository(
              apiProvider: c<CommentsProvider>('comments_provider')),
          name: 'repository');
  }
}
