part of 'get_encripted_qr_string_bloc.dart';

sealed class GetEncriptedQrStringEvent {}

final class GetEncriptedQrSEvent extends GetEncriptedQrStringEvent {
  final String accountCode;
  final String moneyCode;
  final String amount;
  final bool isUniqueUse;
  final String expiredOption;
  final String reference;
  GetEncriptedQrSEvent({
    required this.accountCode,
    required this.moneyCode,
    required this.amount,
    required this.isUniqueUse,
    required this.expiredOption,
    required this.reference,
  });
}
