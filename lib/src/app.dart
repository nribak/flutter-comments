import 'package:comments_app/src/data/blocs/comments/comments_events.dart';
import 'package:comments_app/src/data/blocs/comments_bloc.dart';
import 'package:comments_app/src/widgets/comments_form_dialog.dart';
import 'package:comments_app/src/widgets/comments_list_widget.dart';
import 'package:comments_app/src/widgets/full_comment_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'utils/types.dart';

class App extends StatelessWidget {

  final String? parentCommentId;
  const App({super.key, this.parentCommentId});

  void _showDialog(BuildContext context) {
    final pong = dotenv.env['PING'];
    print(pong);
    final bloc = context.read<CommentsBloc>();
    showDialog<NewCommentData>(
        context: context,
        builder: (ctx) =>
            CommentsFormDialog()
    ).then((data) {
      if(data != null) {
        bloc.add(PostCommentEvent(title: data.title, subtitle: data.subtitle, ref: parentCommentId));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Comments App")
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
                visible: parentCommentId != null,
                child: FullCommentItemWidget(commentId: parentCommentId ?? '')
            ),
            const SizedBox(height: 8),
            const CommentsListWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}