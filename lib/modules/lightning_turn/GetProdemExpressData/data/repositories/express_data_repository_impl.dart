import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class ProdemExpressDataRepositoryImpl extends ProdemExpressDataRepository {
  ExpressDataDatasource datasource;
  ProdemExpressDataRepositoryImpl({required this.datasource});

  @override
  Future<GetProdemExpressDataResponseEntity> expressData(
    String codeSavingAccountSource,
    String amountTransaction,
    String idMoney,
    String idPErson,
    String benificiaryDi,
    String? vToken,
  ) async {
    return await datasource.expressData(
      codeSavingAccountSource,
      amountTransaction,
      idMoney,
      idPErson,
      benificiaryDi,
      vToken,
    );
  }
}
