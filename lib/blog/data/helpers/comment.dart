class Comment {
  final String id;
  final String title;
  final String userId;
  final int childCommentsCount;
  Comment(this.id, this.title, this.userId, this.childCommentsCount);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      Comment(
          json['id'],
          json['title'],
          json['userId'],
          json['childCommentsCount']
      );
}