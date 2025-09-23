import '../entities/entity.dart';

abstract class KeyPrRepository {
  Future<CreateProdemKeyResponseEntity> createPrKey(
    String idUser,
    String idWebOperation,
    String idWebPersonClient,
    String? vToken,
  );

  Future<GetProdemKeyByIdResponseEntity> getPrKeyById(
    String idSmsOperation,
    String? vToken,
  );
}
