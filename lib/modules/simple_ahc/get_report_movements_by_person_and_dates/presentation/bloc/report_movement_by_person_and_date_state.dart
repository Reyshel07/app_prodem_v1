part of 'report_movement_by_person_and_date_bloc.dart';

sealed class ReportMovementByPersonAndDateState {}

final class ReportMovementByPersonAndDateInitial
    extends ReportMovementByPersonAndDateState {}

final class ReportMovementByPersonAndDateLoading
    extends ReportMovementByPersonAndDateState {}

final class ReportMovementByPersonAndDateError
    extends ReportMovementByPersonAndDateState {
  final String message;
  ReportMovementByPersonAndDateError(this.message);
}

final class ReportMovementByPersonAndDateSuccess
    extends ReportMovementByPersonAndDateState {
  final GetReportMovementsByPersonAndDateEntity
  getReportMovementsByPersonAndDateEntity;
  ReportMovementByPersonAndDateSuccess(
    this.getReportMovementsByPersonAndDateEntity,
  );
}
