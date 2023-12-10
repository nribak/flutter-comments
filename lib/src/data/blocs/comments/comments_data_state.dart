import '../../comments_model.dart';

class CommentsDataState {
  final bool isLoading;
  final List<SummaryAppComment> comments;
  final AppComment? parentComment;

  CommentsDataState({required this.isLoading, required this.comments, this.parentComment});

  CommentsDataState copy({bool? isLoading, List<SummaryAppComment>? comments, AppComment? parentComment}) =>
      CommentsDataState(isLoading: isLoading ?? this.isLoading, comments: comments ?? this.comments, parentComment: parentComment ?? this.parentComment);
}