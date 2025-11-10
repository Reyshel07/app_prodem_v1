import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class VerificaPlazoRenovacionRepositoryImpl
    extends VerificaPlazoRenovacionRepository {
  VerificaPlazoRenovacionDatasource datasource;
  VerificaPlazoRenovacionRepositoryImpl({required this.datasource});

  @override
  Future<VerificaPlazoRenovacionResponseEntity> verificaPlazoRenovacion(
    String idDpfOffice,
    String termInDays,
    String? vToken,
  ) async {
    return await datasource.verificaPlazoRenovacion(
      idDpfOffice,
      termInDays,
      vToken,
    );
  }

  @override
  Future<VerifyRedeemResponseEntity> verifyRedeem(
    String term,
    String? vToken,
  ) async {
    return await datasource.verifyRedeem(term, vToken);
  }

  @override
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
  ) async {
    return await datasource.validateAndSaveRenovationDpf(
      idRenovationDPF,
      idcDPFMFInitial,
      idcDPFMFNew,
      idcOperationType,
      cellPhone,
      email,
      idDpfOffice,
      idPersonWeb,
      amount,
      termInDays,
      rate,
      interestEarned,
      finalAmount,
      originResources,
      idcState,
      geographicLocation,
      contextData,
      iP,
      solicitationDate,
      idMoney,
      fullName,
      idSavingsAccount,
      codeSMS,
      idUser,
      withProdemKey,
      isDpfEmployee,
      codeSavingAccount,
      idPerson,
      idcOperationTypeAUX,
      idcInfoType,
      isAnotherAccount,
      amountOnAccount,
      oldAmount,
      interestAmountOld,
      capitalRenew,
      renewalTax,
      closingTax,
      idDepositProduct,
      depositProduct,
      hashTracking,
      isPignorado,
      vToken,
      idSMSOperation,
      prodemKeyCode,
    );
  }
}
