part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent{
  String email;
  String password;
  AuthLoginRequested({required this.email,required this.password});
}


