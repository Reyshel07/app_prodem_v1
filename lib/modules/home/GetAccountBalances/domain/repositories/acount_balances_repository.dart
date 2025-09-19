import 'package:app_prodem_v1/modules/home/GetAccountBalances/domain/entities/account_balances_entity.dart';

abstract class AccountBalancesRespositoriy {
  Future<GetAccountBalancesResponseEntity> accountBalances(
    String codeSavingsAccount,
    String idPErson,
    String idUsert,
    String? vToken,
  );
}
