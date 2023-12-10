import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app.dart';
import '../data/blocs/comments/comments_events.dart';
import '../data/blocs/comments_bloc.dart';
import '../data/comments_model.dart';
import '../data/di/app_di_resolver.dart';

class CommentsItemWidget extends StatelessWidget {
  final SummaryAppComment comment;


  const CommentsItemWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => CommentsBloc.newInstance(
                      repository: DIResolver.instance().repository(),
                      initialEvent: ChildCommentsEvent(comment.id)
                  ),
                  child: App(parentCommentId: comment.id),
                )
            )
          );
        },
        title: Text(comment.title),
        trailing: Badge.count(
          count: comment.childCommentsCount,
          child: const Icon(Icons.comment) ,
        ),
      )
    );
  }
}