part of 'selected_subject_bloc.dart';

@immutable
abstract class SelectedSubjectEvent {}

final class SelectedSubEvent extends SelectedSubjectEvent{
  final String subjectName;
  final String subjectId;
  SelectedSubEvent(this.subjectName,this.subjectId);
}
