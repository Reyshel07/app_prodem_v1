import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/domain/entities/get_valid_account_entity.dart';

abstract class GetValidAccountRepository {
  Future<GetValidAccountResponseEntity> getValidA(
    String idbank,
    String accountNumber,
    String? vToken,
  );
}
