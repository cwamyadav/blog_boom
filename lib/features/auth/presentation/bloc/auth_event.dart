part of 'auth_bloc.dart';

sealed class AuthEvent {}

// event creation
final class AuthSignup extends AuthEvent {
  final String email;
  final String name;
  final String password;
  AuthSignup({
    required this.email,
    required this.password,
    required this.name,
  });
}
