part of 'data_account_for_mobiles_by_code_account_all_bloc.dart';

sealed class DataAccountForMobilesByCodeAccountAllState {}

final class DataAccountForMobilesByCodeAccountAllInitial
    extends DataAccountForMobilesByCodeAccountAllState {}

final class DataAccountForMobilesByCodeAccountAllLoading
    extends DataAccountForMobilesByCodeAccountAllState {}

final class DataAccountForMobilesByCodeAccountAllError
    extends DataAccountForMobilesByCodeAccountAllState {
  final String message;
  DataAccountForMobilesByCodeAccountAllError(this.message);
}

final class DataAccountForMobilesByCodeAccountAllSuccess
    extends DataAccountForMobilesByCodeAccountAllState {
  GetDataAccountForMobilesByCodeAccountAllResponseEntity
  getDataAccountForMobilesByCodeAccountAllResponseEntity;
  DataAccountForMobilesByCodeAccountAllSuccess(
    this.getDataAccountForMobilesByCodeAccountAllResponseEntity,
  );
}
