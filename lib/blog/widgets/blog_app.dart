import 'package:flutter/material.dart';
import 'package:learning_flutter/blog/blog_bloc.dart';
import 'package:learning_flutter/blog/data/helpers/comment.dart';
import 'package:learning_flutter/blog/widgets/blog_comment_details.dart';
import 'package:learning_flutter/blog/widgets/blog_comment_item.dart';

class BlogApp extends StatelessWidget {
  BlogApp({super.key});
  final bloc = BlogBloc.newInstance();

  void _handleTap(BuildContext context, Comment comment) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => BlogCommentDetails(commentId: comment.id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Public Blog"),
              BlogBlocSelector<bool>(
                bloc: bloc,
                selector: (snapshot) => snapshot.isLoading,
                builder: (context, loading) =>
                    Visibility(
                        visible: loading,
                        child: const CircularProgressIndicator()),
              )
            ],
          )
      ),
      body: BlogBlocSelector<Iterable<Comment>>(
          selector: (snapshot) => snapshot.comments,
          bloc: bloc,
          builder: (context, comments) {
            return ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) =>
                    BlogCommentItem(comment: comments.elementAt(index), onTap: (comment) => _handleTap(context, comment))
            );
          }
      ),
    );
  }
}