part of 'create_pr_key_bloc.dart';

sealed class CreatePrKeyState {}

final class CreatePrKeyInitial extends CreatePrKeyState {}

final class CreatePrKeyLoading extends CreatePrKeyState {}

final class CreatePrKeyError extends CreatePrKeyState {
  final String message;
  CreatePrKeyError(this.message);
}

final class CreatePrKeySuccess extends CreatePrKeyState {
  CreateProdemKeyResponseEntity? createProdemKeyResponseEntity;
  CreatePrKeySuccess(this.createProdemKeyResponseEntity);
}
