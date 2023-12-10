import 'package:comments_app/src/data/comments_model.dart';
import 'package:comments_app/src/data/providers/comments_provider.dart';

class CommentsRepository {
  final CommentsProvider _apiProvider;

  CommentsRepository({required CommentsProvider apiProvider}) : _apiProvider = apiProvider;

  Future<List<SummaryAppComment>> list() {
    return _apiProvider.list();
  }
  Future<AppCommentChildren> childCommentsOf(String id) {
    return _apiProvider.childComments(id);
  }

  Future<AppComment> createComment(String title, String? subtitle, String? parentId) {
    return _apiProvider.postComment(title, subtitle, parentId);
  }
}