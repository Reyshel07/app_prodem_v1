part of 'express_data_bloc.dart';

sealed class ExpressDataState {}

final class ExpressDataInitial extends ExpressDataState {}

final class ExpressDataLoading extends ExpressDataState {}

final class ExpressDataError extends ExpressDataState {
  final String message;
  ExpressDataError(this.message);
}

final class ExpressDataSuccess extends ExpressDataState {
  final GetProdemExpressDataResponseEntity getProdemExpressDataResponseEntity;
  ExpressDataSuccess(this.getProdemExpressDataResponseEntity);
}
