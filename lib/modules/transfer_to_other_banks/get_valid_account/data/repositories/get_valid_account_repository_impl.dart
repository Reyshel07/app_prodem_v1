import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/data/datasource/get_valid_account_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/domain/entities/get_valid_account_entity.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/domain/repositories/get_valid_account_repository.dart';

class GetValidAccountRepositoryImpl extends GetValidAccountRepository {
  GetValidAccountDatasource datasource;
  GetValidAccountRepositoryImpl({required this.datasource});

  @override
  Future<GetValidAccountResponseEntity> getValidA(
    String idbank,
    String accountNumber,
    String? vToken,
  ) async {
    return await datasource.getValidAccount(idbank, accountNumber, vToken);
  }
}
