part of 'bank_security_solicitation_result_bloc.dart';

sealed class BankSecuritySolicitationResultState {}

final class BankSecuritySolicitationResultInitial
    extends BankSecuritySolicitationResultState {}

final class BankSecuritySolicitationResultLoading
    extends BankSecuritySolicitationResultState {}

final class BankSecuritySolicitationResultError
    extends BankSecuritySolicitationResultState {
  final String message;
  BankSecuritySolicitationResultError(this.message);
}

final class BankSecuritySolicitationResultSuccess
    extends BankSecuritySolicitationResultState {
  final BankSecuritySolicitationResultResponseEntity
  bankSecuritySolicitationResultResponseEntity;
  BankSecuritySolicitationResultSuccess(
    this.bankSecuritySolicitationResultResponseEntity,
  );
}
