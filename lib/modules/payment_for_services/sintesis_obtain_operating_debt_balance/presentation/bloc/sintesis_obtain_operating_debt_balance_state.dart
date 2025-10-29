part of 'sintesis_obtain_operating_debt_balance_bloc.dart';

sealed class SintesisObtainOperatingDebtBalanceState {}

final class SintesisObtainOperatingDebtBalanceInitial
    extends SintesisObtainOperatingDebtBalanceState {}

final class SintesisObtainOperatingDebtBalanceLoading
    extends SintesisObtainOperatingDebtBalanceState {}

final class SintesisObtainOperatingDebtBalanceError
    extends SintesisObtainOperatingDebtBalanceState {
  final String message;
  SintesisObtainOperatingDebtBalanceError(this.message);
}

final class SintesisObtainOperatingDebtBalanceSuccess
    extends SintesisObtainOperatingDebtBalanceState {
  SintesisObtainOperatingDebtBalanceEntity sintesisObtainOperatingDebtBalance;
  SintesisObtainOperatingDebtBalanceSuccess(
    this.sintesisObtainOperatingDebtBalance,
  );
}
