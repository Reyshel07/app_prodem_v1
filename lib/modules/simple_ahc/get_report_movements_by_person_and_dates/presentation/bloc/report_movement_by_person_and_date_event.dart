part of 'report_movement_by_person_and_date_bloc.dart';

sealed class ReportMovementByPersonAndDateEvent {}

class ReportMovementByPersonAndDatEvent
    extends ReportMovementByPersonAndDateEvent {
  final int movementType;
  final String dateIni;
  final String dateFin;

  ReportMovementByPersonAndDatEvent({
    required this.movementType,
    required this.dateIni,
    required this.dateFin,
  });
}
