part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentsVisible extends CommentState{
  final bool isVisible = true;
}

class CommentsInvisible extends CommentState{
  final bool isVisible = false;
}