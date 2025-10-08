import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/data/datasource/report_movements_by_person_and_dates_datasource.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/domain/entities/report_movements_by_person_and_dates_entity.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/domain/repositories/report_movements_by_person_and_dates_repository.dart';

class ReportMovementsByPersonAndDatesRepositoryImpl
    extends ReportMovementsByPersonAndDatesRepository {
  ReportMovementsByPersonAndDatesDatasource datasource;
  ReportMovementsByPersonAndDatesRepositoryImpl({required this.datasource});

  @override
  Future<GetReportMovementsByPersonAndDatesResponseEntity>
  reportMovementByPErsonAndDate(
    String? vToken,
    int movementType,
    String idPerson,
    String dateIni,
    String dateFin,
  ) async {
    return await datasource.reportMovementByPersonAndDate(
      vToken,
      movementType,
      idPerson,
      dateIni,
      dateFin,
    );
  }
}
