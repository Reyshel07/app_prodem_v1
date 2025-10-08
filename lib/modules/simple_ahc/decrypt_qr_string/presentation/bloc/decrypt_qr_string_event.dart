part of 'decrypt_qr_string_bloc.dart';

sealed class DecryptQrStringEvent {}

class DecryptQrStrEvent extends DecryptQrStringEvent {
  final String qrString;
  DecryptQrStrEvent({required this.qrString});
}
