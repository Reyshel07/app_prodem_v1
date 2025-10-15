import 'package:app_prodem_v1/modules/list_get_other_account_deposit/data/datasource/list_get_other_account_deposit_datasource.dart';
import 'package:app_prodem_v1/modules/list_get_other_account_deposit/domain/repositories/list_get_other_account_deposit_repository.dart';

import '../../domain/entities/entity.dart';

class ListGetOtherAccountDepositRepositoryImpl
    extends ListGetOtherAccountDepositRepository {
  ListGetOtherAccountDepositDatasource datasource;
  ListGetOtherAccountDepositRepositoryImpl({required this.datasource});

  @override
  Future<ListGetOtherAccountDepositResponseEntity> listGetOtherAccountDeposit(
    String? vToken,
    String idPerson,
  ) async {
    return await datasource.listGetOtherAccountDeposit(vToken, idPerson);
  }
}
