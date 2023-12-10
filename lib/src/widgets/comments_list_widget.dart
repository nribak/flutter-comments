import 'package:comments_app/src/data/blocs/comments/comments_events.dart';
import 'package:comments_app/src/data/blocs/comments_bloc.dart';
import 'package:comments_app/src/widgets/comments_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/blocs/comments/comments_data_state.dart';

class CommentsListWidget extends StatelessWidget {
  const CommentsListWidget({super.key});

  void _handleRefresh(CommentsBloc bloc) async {
    bloc.add(FetchCommentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CommentsBloc>();
    return BlocBuilder<CommentsBloc, CommentsDataState>(
        builder: (context, snapshot) =>
            RefreshIndicator(
                onRefresh: () async => _handleRefresh(bloc),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => CommentsItemWidget(comment: snapshot.comments[index]),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: snapshot.comments.length
                )
            )
    );
  }
}