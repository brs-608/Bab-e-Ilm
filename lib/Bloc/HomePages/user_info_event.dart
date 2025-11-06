part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoEvent {}

final class StoreInfo extends UserInfoEvent{
  final String email;
  StoreInfo(this.email);
}

final class CommentInfoTrue extends UserInfoEvent{
  final String email;
  CommentInfoTrue(this.email);
}
final class CommentInfoFalse extends UserInfoEvent{
  final String email;
  CommentInfoFalse(this.email);
}