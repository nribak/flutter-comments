import 'package:comments_app/src/data/comments_model.dart';
import 'package:comments_app/src/data/providers/comments_provider.dart';

class LoopbackAPIProvider implements CommentsProvider  {
  final List<SummaryAppComment> _root = [];

  @override
  Future<AppCommentChildren?> childComments(String id) async {
    return null;
  }

  @override
  Future<List<SummaryAppComment>> list() async => [..._root];

  @override
  Future<AppComment?> postComment(String title, String? subtitle, String? ref) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final comment = AppComment(
        createdAt: now,
        id: now.toString(),
        title: title,
        userId: 'loopback_user',
        updatedAt: now,
        subtitle: subtitle,
        refComment: ref,
        childCommentsCount: 0
    );
    _root.add(comment);
    return comment;
  }

}