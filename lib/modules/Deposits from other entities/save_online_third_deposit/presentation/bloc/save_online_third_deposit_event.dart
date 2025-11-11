part of 'save_online_third_deposit_bloc.dart';

sealed class SaveOnlineThirdDepositEvent {}

class SaveOnlineThirdDepEvent extends SaveOnlineThirdDepositEvent {
  final String accountDestiny;
  final String accountOrigin;
  final String ammount;
  final String bankOrigin;
  final String customerDepositName;
  final String depositDate;
  final String depositVoucher;
  final String destinyOfFunds;
  final String idBankOrigin;
  final String idMoney;
  final String idSavingAccount;
  final String idThirdOnlineDeposit;
  final String idWebPersonClientCreate;
  final String idcOriginType;
  final String idcState;
  final String identityCardNumber;
  final String isOwnAccount;
  final String moneyCode;
  final String nombreCliente;
  final String observations;
  final String sourceOfFunds;
  final String usuarioRegistro;
  final String whatsAppNumber;
  final String idLoanCredit;
  final String idSMSOperation;
  final String prodemKeyCode;
  SaveOnlineThirdDepEvent({
    required this.accountDestiny,
    required this.accountOrigin,
    required this.ammount,
    required this.bankOrigin,
    required this.customerDepositName,
    required this.depositDate,
    required this.depositVoucher,
    required this.destinyOfFunds,
    required this.idBankOrigin,
    required this.idLoanCredit,
    required this.idMoney,
    required this.idSavingAccount,
    required this.idThirdOnlineDeposit,
    required this.idWebPersonClientCreate,
    required this.idcOriginType,
    required this.idcState,
    required this.identityCardNumber,
    required this.isOwnAccount,
    required this.moneyCode,
    required this.nombreCliente,
    required this.observations,
    required this.sourceOfFunds,
    required this.usuarioRegistro,
    required this.whatsAppNumber,
    required this.idSMSOperation,
    required this.prodemKeyCode,
  });
}
