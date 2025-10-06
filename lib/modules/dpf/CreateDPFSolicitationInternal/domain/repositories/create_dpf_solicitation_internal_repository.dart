import '../entities/entity.dart';

abstract class CreateDpfSolicitationInternalRepository {
  Future<CreateDpfSolicitationInternalResponseEntity> createDpfSoliciInternal(
     String? vToken,
    String phoneNumber,
    String contextData,
    String identityCardNumber,
    String location,
    String interesUpdate,
    String amount,
    String amountFinalUpdate,
    String termUpdate,
    String rateUpdate,
    String email,
    String names,
    String term,
    String idOfficeDPF,
    String debitAccountCode,
    String idPerson,
    String ipNumber,
    String idAccount,
    String idUser,
    String idWebPerson,
    bool isEmployee,
  );
}