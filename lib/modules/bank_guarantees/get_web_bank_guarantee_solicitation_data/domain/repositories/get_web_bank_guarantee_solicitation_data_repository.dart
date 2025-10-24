import '../entities/entity.dart';

abstract class GetWebBankGuaranteeSolicitationDataRepository {
  Future<GetWebBankGuaranteeSolicitationDataResponseEntity>
  getWebBankGuaranteeSolicitationData(String idWebPersonClient, String? vToken);
}
