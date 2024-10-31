import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:googleapis/servicecontrol/v2.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async{
      String email = event.email;
      String password = event.password;
      RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      if(email.isEmpty && password.isEmpty){
        emit(AuthFailure("Enter the email and password please"));
      }else if (email.isEmpty){
        emit(AuthFailure("Enter the email please"));
      }else if(password.isEmpty){
        emit(AuthFailure("Enter the password please"));
      }else if(emailRegex.hasMatch(email) == false){
        emit(AuthFailure("Enter the valid email address"));
      }else{
        final auth = FirebaseAuth.instance;
        await auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
          emit(AuthSuccess());
        }).onError((error, stackTrace) {
          if(error.toString().contains("no user record")){
            emit(AuthFailure("There is no user registered with this email"));
          }else{
            emit(AuthFailure("Wrong Password"));
          }

        });
      }


    });
  }
}
