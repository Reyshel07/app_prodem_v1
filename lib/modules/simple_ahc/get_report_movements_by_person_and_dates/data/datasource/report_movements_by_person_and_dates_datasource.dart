import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/data/models/report_movements_by_person_and_dates_model.dart';

import '../../domain/entities/entity.dart';

class ReportMovementsByPersonAndDatesDatasource {
  final ApiClient _apiClient;
  ReportMovementsByPersonAndDatesDatasource(this._apiClient);

  Future<GetReportMovementsByPersonAndDatesResponseEntity>
  reportMovementByPersonAndDate(
    String? vToken,
    int movementType,
    String idPerson,
    String dateIni,
    String dateFin,
  ) async {
    final respose = await _apiClient.post(
      AppStrings.getReportMovementsByPersonAndDates,
      operationName: 'get the list of transfers by QR code',
      data: {
        "MovementType": movementType,
        "IdPerson": idPerson,
        "DateIni": dateIni,
        "DateFin": dateFin,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetReportMovementsByPersonAndDatesResponseModel.fromJson(respose);
  }
}
