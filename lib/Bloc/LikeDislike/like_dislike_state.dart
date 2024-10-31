part of 'like_dislike_bloc.dart';

@immutable
abstract class LikeDislikeState {}

class LikeDislikeInitial extends LikeDislikeState {}

class LikDisState extends LikeDislikeState{
  final Map<String,dynamic> videoData;
  final bool isLiked;
  final bool isDisliked;
  LikDisState(this.videoData,this.isLiked,this.isDisliked);
}