import 'package:flutter/material.dart';

class BlogCommentDetails extends StatelessWidget {
  final String commentId;

  const BlogCommentDetails({super.key, required this.commentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details Page")),
      body: Text(commentId),
    );
  }
}