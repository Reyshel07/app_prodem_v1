part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class SignInEvent extends AuthEvent {
  final String username;
  final String password;
  final int chanel;
  final List<AditionalItemEntity> aditionalItems;

  SignInEvent({
    required this.username,
    required this.password,
    required this.chanel,
    required this.aditionalItems,
  });
}
