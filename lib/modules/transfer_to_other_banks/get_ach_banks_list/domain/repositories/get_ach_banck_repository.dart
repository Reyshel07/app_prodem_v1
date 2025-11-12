import '../entities/entity.dart';

abstract class GetAchBanckRepository {
  Future<GetAchBanksListResponseEntity> getAchBanck(
    String idUser,
    String accountType,
    String? vToken,
  );
  Future<GetValidAccountResponseEntity> getValidAccount(
    String idbank,
    String accountNumber,
    String? vToken,
  );
}
