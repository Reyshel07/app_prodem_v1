import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/data/datasource/get_ach_banck_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/domain/repositories/get_ach_banck_repository.dart';
import '../../domain/entities/entity.dart';

class GetAchBanckRepositoryImpl extends GetAchBanckRepository {
  GetAchBanckDatasource datasource;
  GetAchBanckRepositoryImpl({required this.datasource});

  @override
  Future<GetAchBanksListResponseEntity> getAchBanck(
    String idUser,
    String accountType,
    String? vToken,
  ) async {
    return await datasource.getAchBanckList(idUser, accountType, vToken);
  }
}
