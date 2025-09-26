import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/data/datasource/get_ach_data_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/domain/entities/get_ach_data_entity.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/domain/repositories/get_ach_data_repository.dart';

class GetAchDataRepositoryImpl extends GetAchDataRepository {
  GetAchDataDatasource datasource;
  GetAchDataRepositoryImpl({required this.datasource});

  @override
  Future<GetAchDataResponseEntity> getAchData(
    String idSavingsAccount,
    String amountTransaction,
    String idMoney,
    String idPerson,
    bool isNaturalClient,
    String? vToken,
  ) async {
    return await datasource.getAchData(
      idSavingsAccount,
      amountTransaction,
      idMoney,
      idPerson,
      isNaturalClient,
      vToken,
    );
  }
}
