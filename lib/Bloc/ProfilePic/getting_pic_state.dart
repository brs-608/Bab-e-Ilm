part of 'getting_pic_bloc.dart';

@immutable
abstract class GettingPicState {}

class GettingPicInitial extends GettingPicState {}

final class GettingProPic extends GettingPicState{
  final Map<String,String> profilePics;
  GettingProPic(this.profilePics);
}
