part of 'prodem_express_save_solicitation_bloc.dart';

sealed class ProdemExpressSaveSolicitationEvent {}

class ProdemExpressSaveSoliEvent extends ProdemExpressSaveSolicitationEvent {
  final String idSMSOperation;
  final String prodemKeyCode;
  final String codeSavingAccountSource;
  final String idMoney;
  final String beneficiaryDI;
  final String beneficiaryName;
  final String beneficiaryCellphone;
  final String reasonSolicitation;
  final String isNaturalClient;
  final String amountTransaction;
  ProdemExpressSaveSoliEvent({
    required this.beneficiaryCellphone,
    required this.beneficiaryDI,
    required this.beneficiaryName,
    required this.codeSavingAccountSource,
    required this.idMoney,
    required this.idSMSOperation,
    required this.isNaturalClient,
    required this.prodemKeyCode,
    required this.reasonSolicitation,
    required this.amountTransaction,
  });
}
