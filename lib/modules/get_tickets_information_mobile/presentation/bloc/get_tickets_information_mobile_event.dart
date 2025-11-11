part of 'get_tickets_information_mobile_bloc.dart';

sealed class GetTicketsInformationMobileEvent {}

class GetTicketsInformationMobiEvent extends GetTicketsInformationMobileEvent {
  final String codeAccount;
  GetTicketsInformationMobiEvent({required this.codeAccount});
}
