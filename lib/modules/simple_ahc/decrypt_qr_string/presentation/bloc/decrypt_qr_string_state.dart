part of 'decrypt_qr_string_bloc.dart';

sealed class DecryptQrStringState {}

final class DecryptQrStringInitial extends DecryptQrStringState {}

final class DecryptQrStringLoading extends DecryptQrStringState {}

final class DecryptQrStringError extends DecryptQrStringState {
  final String message;
  DecryptQrStringError(this.message);
}

final class DecryptQrStringSuccess extends DecryptQrStringState {
  DecryptQrStringEntity decryptQrStringEntity;
  DecryptQrStringSuccess(this.decryptQrStringEntity);
}
