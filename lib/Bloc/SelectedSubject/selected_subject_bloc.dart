import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_subject_event.dart';
part 'selected_subject_state.dart';

class SelectedSubjectBloc extends Bloc<SelectedSubjectEvent, SelectedSubjectState> {
  SelectedSubjectBloc() : super(SelectedSubjectInitial()) {
    on<SelectedSubEvent>((event, emit) {
        emit(SelectedSubState(event.subjectName, event.subjectId));
        print("${event.subjectName},${event.subjectId}");
    });
  }
}
