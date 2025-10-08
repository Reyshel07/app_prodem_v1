import '../entities/entity.dart';

abstract class ReportMovementsByPersonAndDatesRepository {
  Future<GetReportMovementsByPersonAndDatesResponseEntity>
  reportMovementByPErsonAndDate(
    String? vToken,
    int movementType,
    String idPerson,
    String dateIni,
    String dateFin,
  );
}
