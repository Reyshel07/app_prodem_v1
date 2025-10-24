part of 'get_web_bank_guarantee_solicitation_data_bloc.dart';

sealed class GetWebBankGuaranteeSolicitationDataState {}

final class GetWebBankGuaranteeSolicitationDataInitial
    extends GetWebBankGuaranteeSolicitationDataState {}

final class GetWebBankGuaranteeSolicitationDataLoading
    extends GetWebBankGuaranteeSolicitationDataState {}

final class GetWebBankGuaranteeSolicitationDataError
    extends GetWebBankGuaranteeSolicitationDataState {
  final String message;
  GetWebBankGuaranteeSolicitationDataError(this.message);
}

final class GetWebBankGuaranteeSolicitationDataSuccess
    extends GetWebBankGuaranteeSolicitationDataState {
  GetWebBankGuaranteeSolicitationDataResponseEntity
  getWebBankGuaranteeSolicitationDataResponseEntity;
  GetWebBankGuaranteeSolicitationDataSuccess(
    this.getWebBankGuaranteeSolicitationDataResponseEntity,
  );
}
