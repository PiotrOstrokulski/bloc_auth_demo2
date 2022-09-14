part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authorized extends AuthState {
  final String token;
  Authorized({
    this.token = 'abc',
  });
}

class Unauthorized extends AuthState {}

class AuthorizationLoading extends AuthState {}
