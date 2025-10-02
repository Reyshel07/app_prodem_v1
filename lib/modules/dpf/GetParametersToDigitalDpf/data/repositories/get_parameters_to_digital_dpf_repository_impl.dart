import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/data/datasource/get_parameters_to_digital_dpf_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/domain/entities/get_parameters_to_digital_dpf_entity.dart';

import '../../domain/repositories/repository.dart';

class GetParametersToDigitalDpfRepositoryImpl
    extends GetParametersToDigitalDpfRepository {
  GetParametersToDigitalDpfDatasource datasource;
  GetParametersToDigitalDpfRepositoryImpl({required this.datasource});

  @override
  Future<GetParametersToDigitalDpfResponseentity> getParametersToDigitalDpf(
    String idFather,
    bool isEmployee,
    String? vToken,
  ) async {
    return await datasource.getParametersToDigitalDpf(
      idFather,
      isEmployee,
      vToken,
    );
  }

  @override
  Future<GetOfficeListByIdGeographicLocationEntity> getOfficeListByIdGeo(
    String operationName,
    String? vToken,
  ) async {
    return await datasource.getOfficeListByIdGeo(operationName, vToken);
  }

  @override
  Future<GetDateEstimateResponseEntity> getDateEst(
    String term,
    String idOffice,
    String? vToken,
  ) async {
    return await datasource.getDateEst(term, idOffice, vToken);
  }
}
