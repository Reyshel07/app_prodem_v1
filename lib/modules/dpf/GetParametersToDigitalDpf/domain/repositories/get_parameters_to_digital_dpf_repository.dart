import '../entities/entity.dart';

abstract class GetParametersToDigitalDpfRepository {
  Future<GetParametersToDigitalDpfResponseentity> getParametersToDigitalDpf(
    String idFather,
    bool isEmployee,
    String? vToken,
  );
  Future<GetOfficeListByIdGeographicLocationEntity> getOfficeListByIdGeo(
    String operationName,
    String? vToken,
  );

  Future<GetDateEstimateResponseEntity> getDateEst(
    String term,
    String idOffice,
    String? vToken,
  );
}
