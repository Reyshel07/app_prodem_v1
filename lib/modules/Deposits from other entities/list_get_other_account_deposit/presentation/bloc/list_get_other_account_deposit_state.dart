part of 'list_get_other_account_deposit_bloc.dart';

sealed class ListGetOtherAccountDepositState {}

final class ListGetOtherAccountDepositInitial
    extends ListGetOtherAccountDepositState {}

final class ListGetOtherAccountDepositLoading
    extends ListGetOtherAccountDepositState {}

final class ListGetOtherAccountDepositError
    extends ListGetOtherAccountDepositState {
  final String message;
  ListGetOtherAccountDepositError(this.message);
}

final class ListGetOtherAccountDepositSuccess
    extends ListGetOtherAccountDepositState {
  List<ListGetOtherDccountDepositEntity>
  listGetOtherAccountDepositResponseEntity;
  ListGetOtherAccountDepositSuccess(
    this.listGetOtherAccountDepositResponseEntity,
  );
}
