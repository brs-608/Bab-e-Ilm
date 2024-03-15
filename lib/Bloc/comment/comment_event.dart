part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class ShowComment extends CommentEvent{
  final bool showComment = true;
}


class HideComment extends CommentEvent{
  final bool showComment = false;
}