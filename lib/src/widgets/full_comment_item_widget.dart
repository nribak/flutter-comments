import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/blocs/comments/comments_data_state.dart';
import '../data/blocs/comments_bloc.dart';

class FullCommentItemWidget extends StatelessWidget {
  final String commentId;

  const FullCommentItemWidget({super.key, required this.commentId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsDataState>(
        builder: (context, snapshot) {
          return Card(
              child: ListTile(
                title: Text(snapshot.parentComment?.title ?? ''),
                subtitle: Text(snapshot.parentComment?.subtitle ?? ''),
              )
          );
        }
    );

  }
}