import 'package:comments_app/src/data/comments_repository.dart';
import 'package:comments_app/src/data/providers/comments_api_provider.dart';
import 'package:comments_app/src/data/providers/comments_provider.dart';
import 'package:kiwi/kiwi.dart';

//flutter packages pub run build_runner build

part 'app_injector.g.dart';

const commentsProviderKey = 'comments_provider';
const repositoryKey = "repository";
abstract class AppInjector {

  // @Register.singleton(CommentsProvider, from: CommentsInMemoryProvider, name: commentsProviderKey)
  // @Register.factory(CommentsRepository, resolvers: {CommentsProvider: commentsProviderKey}, name: repositoryKey)
  // void development();

  @Register.singleton(CommentsProvider, from: CommentsAPIProvider, name: commentsProviderKey)
  @Register.factory(CommentsRepository, resolvers: {CommentsProvider: commentsProviderKey}, name: repositoryKey)
  void production();

}

enum AppEnvironment {
  prod, dev
}
void diSetup(AppEnvironment env) {
  final injector = _$AppInjector();
  switch(env) {
    case AppEnvironment.prod:
      injector.production();
      break;
    case AppEnvironment.dev:
      break;
  }
}