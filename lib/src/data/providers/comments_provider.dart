import '../comments_model.dart';

abstract interface class CommentsProvider {

  Future<List<SummaryAppComment>> list();
  Future<AppCommentChildren> childComments(String id);
  Future<AppComment> postComment(String title, String? subtitle, String? ref);
}