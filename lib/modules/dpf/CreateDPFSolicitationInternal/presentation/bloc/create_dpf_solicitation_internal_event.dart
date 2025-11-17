part of 'create_dpf_solicitation_internal_bloc.dart';

sealed class CreateDpfSolicitationInternalEvent {}

class CreateDpfSolicitInternalEvent extends CreateDpfSolicitationInternalEvent {
  final String contextData;
  final String interesUpdate;
  final String amount;
  final String amountFinalUpdate;
  final String termUpdate;
  final String rateUpdate;
  final String email;
  final String term;
  final String idOfficeDPF;
  final String debitAccountCode;
  final String ipNumber;
  final String idAccount;
  final String idSMSOperation;
  final String prodemKeyCode;

  CreateDpfSolicitInternalEvent({
    required this.contextData,
    required this.amount,
    required this.amountFinalUpdate,
    required this.debitAccountCode,
    required this.email,
    required this.idAccount,
    required this.idOfficeDPF,
    required this.interesUpdate,
    required this.ipNumber,
    required this.rateUpdate,
    required this.term,
    required this.termUpdate,
    required this.idSMSOperation,
    required this.prodemKeyCode,
  });
}
