import '../entities/entity.dart';

abstract class KeyPrRepository {
  Future<CreateProdemKeyResponseEntity> createPrKey(
    String idUser,
    String idWebOperation,
    String idWebPersonClient,
    String? vToken,
    String location,
    String ip,
    String imei,
  );

  Future<GetProdemKeyByIdResponseEntity> getPrKeyById(
    String idSmsOperation,
    String? vToken,
    String location,
  );
}
