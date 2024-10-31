import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<ShowComment>((event, emit) {
      emit(CommentsVisible());
    });

    on<HideComment>((event,emit){
      emit(CommentsInvisible());
    });
  }
}
