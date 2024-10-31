part of 'like_dislike_bloc.dart';

@immutable
abstract class LikeDislikeEvent {}

class LikDisEvent extends LikeDislikeEvent{
  final Map<String,dynamic> videoData;
  final bool isLiked;
  final bool isDisliked;
  LikDisEvent(this.videoData,this.isLiked,this.isDisliked);
}

class LikeEvent extends LikeDislikeEvent{
  final String videoTitle;
  final String userEmail;
  final String groupName;
  final String lectureName;
  LikeEvent(this.videoTitle,this.userEmail,this.groupName,this.lectureName);
}

class DislikeEvent extends LikeDislikeEvent{
  final String videoTitle;
  final String userEmail;
  final String groupName;
  final String lectureName;
  DislikeEvent(this.videoTitle,this.userEmail,this.groupName,this.lectureName);
}

