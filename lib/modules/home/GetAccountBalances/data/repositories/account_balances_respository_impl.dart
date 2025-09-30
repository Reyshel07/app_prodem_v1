import 'package:app_prodem_v1/modules/home/GetAccountBalances/domain/entities/account_balances_entity.dart';
import 'package:app_prodem_v1/modules/home/GetAccountBalances/domain/repositories/acount_balances_repository.dart';

import '../datasource/datasource.dart';

class AccountBalancesRespositoryImpl extends AccountBalancesRespositoriy {
  AccountBalancesDatasource accountBalancesDatasource;
  AccountBalancesRespositoryImpl({required this.accountBalancesDatasource});
  @override
  Future<GetAccountBalancesResponseEntity> accountBalances(
    String codeSavingsAccount,
    String idPErson,
    String idUsert,
    String? vToken,
    String location,
    String  ip,String imei
  ) async {
    return await accountBalancesDatasource.accountBalances(
      codeSavingsAccount,
      idPErson,
      idUsert,
      vToken,
      location,ip, imei
    );
  }
}
