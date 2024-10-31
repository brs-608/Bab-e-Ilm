part of 'selected_subject_bloc.dart';

@immutable
abstract class SelectedSubjectState {}

class SelectedSubjectInitial extends SelectedSubjectState {}

class SelectedSubState extends SelectedSubjectState{
  final String subjectId;
  final String subjectName;
  SelectedSubState(this.subjectName,this.subjectId);
}
