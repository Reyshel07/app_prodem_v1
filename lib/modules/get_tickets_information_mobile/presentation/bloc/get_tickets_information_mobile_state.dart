part of 'get_tickets_information_mobile_bloc.dart';

sealed class GetTicketsInformationMobileState {}

final class GetTicketsInformationMobileInitial
    extends GetTicketsInformationMobileState {}

final class GetTicketsInformationMobileLoading
    extends GetTicketsInformationMobileState {}

final class GetTicketsInformationMobileError
    extends GetTicketsInformationMobileState {
  final String message;
  GetTicketsInformationMobileError(this.message);
}

final class GetTicketsInformationMobileSuccess
    extends GetTicketsInformationMobileState {
  GetTicketsInformationMobileResponseEntity
  getTicketsInformationMobileResponseEntity;
  GetTicketsInformationMobileSuccess(
    this.getTicketsInformationMobileResponseEntity,
  );
}
