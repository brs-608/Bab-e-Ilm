part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserDataState extends UserInfoState{
  final Map<String,dynamic> data;
  UserDataState(this.data);
}

