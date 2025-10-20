import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class ProdemExpressSaveSolicitationRepositoryImpl
    extends ProdemExpressSaveSolicitationRepository {
  ProdemExpressSaveSolicitationDatasource datasource;
  ProdemExpressSaveSolicitationRepositoryImpl({required this.datasource});

  @override
  Future<ProdemExpressSaveSolicitationResponseEntity>
  prodemExpressSaveSolicitation(
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
    String codeSavingAccountSource,
    String amountTransaction,
    String idMoney,
    String idPerson,
    String beneficiaryDI,
    String beneficiaryName,
    String beneficiaryCellphone,
    String reasonSolicitation,
    String isNaturalClient,
    String idUser,
    String iMEI,
    String location,
    String ipAddress,
  ) async {
    return await datasource.prodemExpressSaveSolicitation(
      vToken,
      idSMSOperation,
      prodemKeyCode,
      codeSavingAccountSource,
      amountTransaction,
      idMoney,
      idPerson,
      beneficiaryDI,
      beneficiaryName,
      beneficiaryCellphone,
      reasonSolicitation,
      isNaturalClient,
      idUser,
      iMEI,
      location,
      ipAddress,
    );
  }
}
