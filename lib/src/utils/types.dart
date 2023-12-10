typedef JsonMap = Map<String, dynamic>;

class NewCommentData {
  final String title;
  final String? subtitle;

  NewCommentData({required this.title, this.subtitle});
}