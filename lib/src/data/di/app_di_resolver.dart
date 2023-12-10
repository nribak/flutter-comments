import 'package:comments_app/src/data/comments_repository.dart';
import 'package:comments_app/src/data/providers/comments_api_provider.dart';
import 'package:kiwi/kiwi.dart';

class DIResolver {

  static DIResolver? _internal;

  DIResolver();

  CommentsRepository repository() =>
      KiwiContainer().resolve<CommentsRepository>('repository');

  CommentsAPIProvider commentsAPIProvider() =>
      KiwiContainer().resolve<CommentsAPIProvider>('api-provider');


  factory DIResolver.instance() {
    var instance = _internal;
    if(instance != null) {
      return instance;
    } else {
      instance = DIResolver();
      _internal = instance;
      return instance;
    }
  }
}