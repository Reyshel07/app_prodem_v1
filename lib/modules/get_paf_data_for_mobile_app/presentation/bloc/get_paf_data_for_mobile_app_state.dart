part of 'get_paf_data_for_mobile_app_bloc.dart';

sealed class GetPafDataForMobileAppState {}

final class GetPafDataForMobileAppInitial extends GetPafDataForMobileAppState {}

final class GetPafDataForMobileAppLoading extends GetPafDataForMobileAppState {}

final class GetPafDataForMobileAppError extends GetPafDataForMobileAppState {
  final String message;
  GetPafDataForMobileAppError(this.message);
}

final class GetPafDataForMobileAppSuccess extends GetPafDataForMobileAppState {
  final GetPafDataForMobileAppResponseEntity
  getPafDataForMobileAppResponseEntity;
  GetPafDataForMobileAppSuccess(this.getPafDataForMobileAppResponseEntity);
}
