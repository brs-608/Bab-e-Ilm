part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState{
    final loading = true;
}

final class AuthFailure extends AuthState{
    final String error;
    AuthFailure(this.error);
}

