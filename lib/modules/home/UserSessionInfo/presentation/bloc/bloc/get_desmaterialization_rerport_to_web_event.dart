part of 'get_desmaterialization_rerport_to_web_bloc.dart';

sealed class GetDesmaterializationRerportToWebEvent {}

class GetDesmaRerToWebEvent extends GetDesmaterializationRerportToWebEvent {
  final String codeOperation;
  GetDesmaRerToWebEvent(this.codeOperation);
}
