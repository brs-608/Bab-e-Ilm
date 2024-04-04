part of 'getting_pic_bloc.dart';

@immutable
abstract class GettingPicEvent {}

final class StorePic extends GettingPicEvent{
  final List<String> sendersEmail;
  StorePic(this.sendersEmail);
}
