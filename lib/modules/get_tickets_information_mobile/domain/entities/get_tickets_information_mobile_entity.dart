class GetTicketsInformationMobileResponseEntity {
  final GetTicketsInformationMobileEntity data;
  final int state;
  final String message;

  GetTicketsInformationMobileResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetTicketsInformationMobileEntity {
  final dynamic colTicketInfomation;
  final dynamic colTickets;

  GetTicketsInformationMobileEntity({
    required this.colTicketInfomation,
    required this.colTickets,
  });
}
