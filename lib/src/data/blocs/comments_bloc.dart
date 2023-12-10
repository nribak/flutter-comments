import 'package:bloc/bloc.dart';
import 'package:comments_app/src/data/blocs/comments/comments_data_state.dart';
import 'package:comments_app/src/data/blocs/comments/comments_events.dart';
import '../comments_repository.dart';


class CommentsBloc extends Bloc<CommentsChangeEvent, CommentsDataState> {
  final CommentsRepository repository;

  CommentsBloc(this.repository): super(CommentsDataState(isLoading: false, comments: []));

  void _init() {
    on<FetchCommentsEvent>((event, emit) async {
      emit(state.copy(isLoading: true));
      final comments = await repository.list();
      emit(CommentsDataState(isLoading: false, comments: comments, parentComment: null));
    });

    on<ChildCommentsEvent>((event, emit) async {
      emit(state.copy(isLoading: true));
      final childComments = await repository.childCommentsOf(event.parentId);
      if(childComments != null) {
        emit(CommentsDataState(isLoading: false, comments: childComments.children,  parentComment: childComments.comment));
      }
    });

    on<PostCommentEvent>((event, emit) async {
      emit(state.copy(isLoading: true));
      final comment = await repository.createComment(event.title, event.subtitle, event.ref);
      if(comment != null) {
        final commentsList = [...state.comments, comment];
        emit(state.copy(isLoading: false, comments: commentsList));
      }
    });

  }

  factory CommentsBloc.newInstance({required CommentsRepository repository, CommentsChangeEvent? initialEvent}) {
    final bloc = CommentsBloc(repository);
    bloc._init();
    if(initialEvent != null) {
      bloc.add(initialEvent);
    }
    return bloc;
  }
}


