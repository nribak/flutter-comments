import 'package:learning_flutter/blog/data/blog_api_provider.dart';

import 'helpers/comment.dart';

class BlogRepository {
  final BlogAPIProvider apiProvider;
  BlogRepository({required this.apiProvider});

  Future<Iterable<Comment>> listComments() => apiProvider.listComments();

}