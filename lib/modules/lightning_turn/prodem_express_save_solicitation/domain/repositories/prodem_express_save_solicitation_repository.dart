import '../entities/entity.dart';

abstract class ProdemExpressSaveSolicitationRepository {
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
  );
}
