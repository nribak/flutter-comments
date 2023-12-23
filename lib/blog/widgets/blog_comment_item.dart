import 'package:flutter/material.dart';
import 'package:learning_flutter/blog/data/helpers/comment.dart';

class BlogCommentItem extends StatelessWidget {
  final Comment comment;
  final void Function(Comment comment) onTap;
  const BlogCommentItem({super.key, required this.comment, required this.onTap});

  void _handleTap() => onTap(comment);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _handleTap,
      title: Text(comment.title),
      trailing: Badge(
        label: Text(comment.childCommentsCount.toString()),
        child: const Icon(Icons.comment),
      )
    );
  }
}