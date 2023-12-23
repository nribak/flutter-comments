import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/blog/data/blog_api_provider.dart';
import 'package:learning_flutter/blog/data/blog_repository.dart';

import 'data/helpers/comment.dart';

enum BlogEventType {
  fetch
}
class BlogEvent {
  final BlogEventType type;
  final dynamic payload;

  BlogEvent({required this.type, this.payload});
}

class BlogState {
  final bool isLoading;
  final Iterable<Comment> comments;
  BlogState({required this.isLoading, required this.comments});
}

typedef BlogBlocSelector<T> = BlocSelector<BlogBloc, BlogState, T>;

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository repository;

  BlogBloc({required this.repository}): super(BlogState(isLoading: false, comments: []));

  void _init() {
    on<BlogEvent>((event, emit) async {
      switch(event.type) {
        case BlogEventType.fetch:
          emit(BlogState(isLoading: true, comments: []));
          final comments = await repository.listComments();
          emit(BlogState(isLoading: false, comments: comments));
          break;
      }
    });

  }

  factory BlogBloc.newInstance() {
    final bloc = BlogBloc(repository: BlogRepository(apiProvider: BlogAPIProvider()));
    bloc._init();
    bloc.add(BlogEvent(type: BlogEventType.fetch));
    return bloc;
  }
}
