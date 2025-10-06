import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/domain/entities/entity.dart';

abstract class GetListDpfDigitalSolicitationRepository {
  Future<GetListDpfDigitalSolicitationResponseEntity> getListDpfDigitalSoliR(
    String idWebPerson,
    String? vToken,
  );
}
