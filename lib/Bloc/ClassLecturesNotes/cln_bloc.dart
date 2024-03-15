import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cln_event.dart';
part 'cln_state.dart';

class ClnBloc extends Bloc<ClnEvent, ClnState> {
  ClnBloc() : super(ClnInitial()) {
    on<ClnEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
