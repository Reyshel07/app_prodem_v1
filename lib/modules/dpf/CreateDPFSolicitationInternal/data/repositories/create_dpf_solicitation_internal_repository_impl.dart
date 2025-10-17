import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/data/datasource/create_dpf_solicitation_internal_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/domain/entities/create_dpf_solicitation_internal_entity.dart';

import '../../domain/repositories/repository.dart';

class CreateDpfSolicitationInternalRepositoryImpl
    extends CreateDpfSolicitationInternalRepository {
  CreateDpfSolicitationInternalDatasource datasource;
  CreateDpfSolicitationInternalRepositoryImpl({required this.datasource});

  @override
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
    String idSMSOperation,
    String prodemKeyCode,
  ) async {
    return await datasource.createDpfSoliciInternal(
      vToken,
      phoneNumber,
      contextData,
      identityCardNumber,
      location,
      interesUpdate,
      amount,
      amountFinalUpdate,
      termUpdate,
      rateUpdate,
      email,
      names,
      term,
      idOfficeDPF,
      debitAccountCode,
      idPerson,
      ipNumber,
      idAccount,
      idUser,
      idWebPerson,
      isEmployee,
      idSMSOperation,
      prodemKeyCode,
    );
  }
}
