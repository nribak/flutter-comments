import 'package:comments_app/src/utils/extensions.dart';

class SummaryAppComment {
  final String id;
  final String title;
  final String userId;
  final int updatedAt;
  final String? refComment;
  final int childCommentsCount;

  const SummaryAppComment({
    required this.id,
    required this.title,
    required this.userId,
    required this.updatedAt,
    required this.childCommentsCount,
    this.refComment,
  });

  factory SummaryAppComment.fromJSON(Map<String, dynamic> json) =>
      SummaryAppComment(
          id: json['id'],
          title: json['title'],
          userId: json['userId'],
          updatedAt: json['updatedAt'],
          refComment: json['refComment'],
          childCommentsCount: json['childCommentsCount']
      );
}

class AppComment extends SummaryAppComment {
  final String? subtitle;
  final int createdAt;

  AppComment({
    this.subtitle,
    required this.createdAt,
    required super.id,
    required super.title,
    required super.userId,
    super.refComment,
    required super.updatedAt,
    required super.childCommentsCount
  });

  factory AppComment.fromJSON(Map<String, dynamic> json) =>
      AppComment(
          id: json['id'],
          title: json['title'],
          userId: json['userId'],
          createdAt: json['createdAt'],
          updatedAt: json['updatedAt'],
          refComment: json['refComment'],
          childCommentsCount: json['childCommentsCount'],
          subtitle: json['subtitle']
      );
}

class AppCommentChildren {
  final AppComment comment;
  final List<SummaryAppComment> children;
  AppCommentChildren(this.comment, this.children);

  factory AppCommentChildren.fromJSON(Map<String, dynamic> json) {
    final comment = AppComment.fromJSON(json['comment']);
    final List<dynamic> rawChildren = json['children'];
    final children = rawChildren.fixedListMap((child) => SummaryAppComment.fromJSON(child));
    return AppCommentChildren(comment, children);
  }
}