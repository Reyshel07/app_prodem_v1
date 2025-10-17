part of 'create_dpf_solicitation_internal_bloc.dart';

sealed class CreateDpfSolicitationInternalEvent {}

class CreateDpfSolicitInternalEvent extends CreateDpfSolicitationInternalEvent {
  final String phoneNumber;
  final String contextData;
  final String identityCardNumber;
  final String interesUpdate;
  final String amount;
  final String amountFinalUpdate;
  final String termUpdate;
  final String rateUpdate;
  final String email;
  final String names;
  final String term;
  final String idOfficeDPF;
  final String debitAccountCode;
  final String ipNumber;
  final String idAccount;
  final bool isEmployee;
  final String idSMSOperation;
  final String prodemKeyCode;

  CreateDpfSolicitInternalEvent({
    required this.phoneNumber,
    required this.contextData,
    required this.amount,
    required this.amountFinalUpdate,
    required this.debitAccountCode,
    required this.email,
    required this.idAccount,
    required this.idOfficeDPF,
    required this.identityCardNumber,
    required this.interesUpdate,
    required this.ipNumber,
    required this.isEmployee,
    required this.names,
    required this.rateUpdate,
    required this.term,
    required this.termUpdate,
    required this.idSMSOperation,
    required this.prodemKeyCode,
  });
}
