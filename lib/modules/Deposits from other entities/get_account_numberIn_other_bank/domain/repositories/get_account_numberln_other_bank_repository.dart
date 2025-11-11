import '../entities/entity.dart';

abstract class GetAccountNumberlnOtherBankRepository {
  Future<GetAccountNumberInOtherBankResponseEntity> accountNumberlnOtherBank(
    String? vToken,
  );
  Future<GetFavoritesOtherDepositsResponseEntity> getFavoritesOtherDeposits(
    String? vToken,
    String idUser,
  );
}
