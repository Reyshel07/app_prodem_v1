import '../entities/entity.dart';

abstract class VerificaPlazoRenovacionRepository {
  Future<VerificaPlazoRenovacionResponseEntity> verificaPlazoRenovacion(
    String idDpfOffice,
    String termInDays,
    String? vToken,
  );

  Future<VerifyRedeemResponseEntity> verifyRedeem(String term, String? vToken);
  Future<ValidateAndSaveRenovationDpfResponseEntity>
  validateAndSaveRenovationDpf(
    String idRenovationDPF,
    String idcDPFMFInitial,
    String idcDPFMFNew,
    String idcOperationType,
    String cellPhone,
    String email,
    String idDpfOffice,
    String idPersonWeb,
    String amount,
    String termInDays,
    String rate,
    String interestEarned,
    String finalAmount,
    String originResources,
    String idcState,
    String geographicLocation,
    String contextData,
    String iP,
    String solicitationDate,
    String idMoney,
    String fullName,
    String idSavingsAccount,
    String codeSMS,
    String idUser,
    bool withProdemKey,
    bool isDpfEmployee,
    String codeSavingAccount,
    String idPerson,
    String idcOperationTypeAUX,
    String idcInfoType,
    bool isAnotherAccount,
    String amountOnAccount,
    String oldAmount,
    String interestAmountOld,
    String capitalRenew,
    String renewalTax,
    String closingTax,
    String idDepositProduct,
    String depositProduct,
    String hashTracking,
    bool isPignorado,
    String? vToken,
    String? idSMSOperation,
    String? prodemKeyCode,
  );
}
