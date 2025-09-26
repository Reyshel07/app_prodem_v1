import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/domain/entities/get_ach_data_entity.dart';

abstract class GetAchDataRepository {
  Future<GetAchDataResponseEntity> getAchData(
    String idSavingsAccount,
    String amountTransaction,
    String idMoney,
    String idPerson,
    bool isNaturalClient,
    String? vToken,
  );
}
