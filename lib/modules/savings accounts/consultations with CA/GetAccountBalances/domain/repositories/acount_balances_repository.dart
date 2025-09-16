import 'package:app_prodem_v1/modules/savings%20accounts/consultations%20with%20CA/GetAccountBalances/domain/entities/account_balances_entity.dart';

abstract class AccountBalancesRespositoriy {
  Future<GetAccountBalancesResponseEntity> accountBalances(
    String codeSavingsAccount,
  );
}
