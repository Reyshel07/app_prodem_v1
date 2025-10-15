import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/data/datasource/get_account_numberln_other_bank_datasource.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/domain/entities/get_account_numberln_other_bank_entity.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/domain/repositories/get_account_numberln_other_bank_repository.dart';

class GetAccountNumberinOtherBankRepositoryImpl
    extends GetAccountNumberlnOtherBankRepository {
  GetAccountNumberlnOtherBankDatasource datasource;
  GetAccountNumberinOtherBankRepositoryImpl({required this.datasource});

  @override
  Future<GetAccountNumberInOtherBankResponseEntity> accountNumberlnOtherBank(
    String? vToken,
  ) async {
    return await datasource.accountNumberLnUtherBank(vToken);
  }
}
