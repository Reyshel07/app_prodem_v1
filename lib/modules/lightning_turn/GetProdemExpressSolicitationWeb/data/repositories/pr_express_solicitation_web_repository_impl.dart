import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/data/datasource/pr_express_solicitation_web_datasource.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/domain/entities/pr_express_solicitation_web_entity.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/domain/repositories/pr_express_solicitation_web_repository.dart';

class PrExpressSolicitationWebRepositoryImpl
    extends PrExpressSolicitationWebRepository {
  PrExpressSolicitationWebDatasource datasource;
  PrExpressSolicitationWebRepositoryImpl({required this.datasource});

  @override
  Future<GetProdemExpressSolicitationWebResponseEntity> prExpressSoliWeb(
    String idPerson,
    String? vToken,
    List<String> colCodeSavingsAccounts,
  ) async {
    return await datasource.prExpressSoliWeb(
      idPerson,
      vToken,
      colCodeSavingsAccounts,
    );
  }

  @override
  Future<ProdemExpressAnnulmentResponseEntity> prDelete(
    String id,
    String? vToken,
  ) async {
    return await datasource.prDelete(id, vToken);
  }
}
