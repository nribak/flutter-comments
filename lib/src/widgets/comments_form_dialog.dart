import 'package:flutter/material.dart';

import '../utils/types.dart';

class CommentsFormDialog extends StatelessWidget {

  CommentsFormDialog({super.key});

  final _titleController = TextEditingController(text: '');
  final _subTitleController = TextEditingController(text: '');

  void _handleSubmit(BuildContext context) {
    final data = NewCommentData(
        title: _titleController.text,
        subtitle: _subTitleController.text
    );
    Navigator.pop(context, data);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: const Text("New Comment"),
        contentPadding: const EdgeInsets.all(16),
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'title'
            ),
            controller: _titleController,
          ),
          const SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'subtitle'
            ),
            controller: _subTitleController,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () => _handleSubmit(context),
              child: const Text('Create')
          )
        ]
    );
  }
}