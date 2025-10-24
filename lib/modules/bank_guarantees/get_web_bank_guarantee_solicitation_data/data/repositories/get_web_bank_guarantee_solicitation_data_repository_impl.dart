import 'package:app_prodem_v1/modules/bank_guarantees/get_web_bank_guarantee_solicitation_data/domain/entities/get_web_bank_guarantee_solicitation_data_entity.dart';

import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GetWebBankGuaranteeSolicitationDataRepositoryImpl
    extends GetWebBankGuaranteeSolicitationDataRepository {
  GetWebBankGuaranteeSolicitationDataDatasource dataDatasource;
  GetWebBankGuaranteeSolicitationDataRepositoryImpl({
    required this.dataDatasource,
  });

  @override
  Future<GetWebBankGuaranteeSolicitationDataResponseEntity>
  getWebBankGuaranteeSolicitationData(
    String idWebPersonClient,
    String? vToken,
  ) async {
    return await dataDatasource.getWebBankGuaranteeSolicitationData(
      idWebPersonClient,
      vToken,
    );
  }
}
