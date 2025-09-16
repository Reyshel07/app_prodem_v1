import 'package:app_prodem_v1/modules/savings%20accounts/consultations%20with%20CA/GetAccountBalances/domain/entities/account_balances_entity.dart';
import 'package:app_prodem_v1/modules/savings%20accounts/consultations%20with%20CA/GetAccountBalances/domain/repositories/acount_balances_repository.dart';

import '../datasource/datasource.dart';

class AccountBalancesRespositoryImpl extends AccountBalancesRespositoriy {
  AccountBalancesDatasource accountBalancesDatasource;
  AccountBalancesRespositoryImpl({required this.accountBalancesDatasource});
  @override
  Future<GetAccountBalancesResponseEntity> accountBalances(
    String codeSavingsAccount,
  ) async {
    return await accountBalancesDatasource.accountBalances(codeSavingsAccount);
  }
}
