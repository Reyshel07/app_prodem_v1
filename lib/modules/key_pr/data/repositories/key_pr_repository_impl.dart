import 'package:app_prodem_v1/modules/key_pr/data/datasource/key_pr_datasource.dart';
import 'package:app_prodem_v1/modules/key_pr/domain/entities/key_pr_entity.dart';
import 'package:app_prodem_v1/modules/key_pr/domain/repositories/repository.dart';

class KeyPrRepositoryImpl extends KeyPrRepository {
  KeyPrDatasource keyPrDatasource;
  KeyPrRepositoryImpl({required this.keyPrDatasource});

  @override
  Future<CreateProdemKeyResponseEntity> createPrKey(
    String idUser,
    String idWebOperation,
    String idWebPersonClient,
    String? vToken,
  ) async {
    return await keyPrDatasource.createPrKey(
      idUser,
      idWebOperation,
      idWebPersonClient,
      vToken,
    );
  }

  @override
  Future<GetProdemKeyByIdResponseEntity> getPrKeyById(
    String idSmsOperation,
    String? vToken,
  ) async {
    return await keyPrDatasource.getPrKeyById(idSmsOperation, vToken);
  }
}
