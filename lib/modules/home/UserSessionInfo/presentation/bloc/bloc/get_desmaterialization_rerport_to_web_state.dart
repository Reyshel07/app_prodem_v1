part of 'get_desmaterialization_rerport_to_web_bloc.dart';

sealed class GetDesmaterializationRerportToWebState {}

final class GetDesmaterializationRerportToWebInitial
    extends GetDesmaterializationRerportToWebState {}

final class SessionInfoLoading extends GetDesmaterializationRerportToWebState {}

final class GetDesmaterializationRerportToWebError
    extends GetDesmaterializationRerportToWebState {
  final String message;
  GetDesmaterializationRerportToWebError(this.message);
}

final class GetDesmaterializationRerportToWebSuccess
    extends GetDesmaterializationRerportToWebState {
  GetDesmaterializationRerportToWebResponseEntity
  getDesmaterializationRerportToWebResponseEntity;
  GetDesmaterializationRerportToWebSuccess(
    this.getDesmaterializationRerportToWebResponseEntity,
  );
}
