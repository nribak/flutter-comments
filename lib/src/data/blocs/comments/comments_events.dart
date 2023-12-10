sealed class CommentsChangeEvent {}

final class FetchCommentsEvent extends CommentsChangeEvent {}

final class ChildCommentsEvent extends CommentsChangeEvent {
  final String parentId;
  ChildCommentsEvent(this.parentId);
}

final class PostCommentEvent extends CommentsChangeEvent {
  final String title;
  final String? subtitle;
  final String? ref;
  PostCommentEvent({required this.title, this.subtitle, required this.ref});
}