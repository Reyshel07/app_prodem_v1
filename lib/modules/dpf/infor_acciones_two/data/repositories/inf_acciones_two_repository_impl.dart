import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/data/datasource/inf_acciones_two_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/domain/entities/inf_acciones_two_entity.dart';
import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/domain/repositories/inf_acciones_two_repository.dart';

class InfAccionesTwoRepositoryImpl extends InfAccionesTwoRepository {
  InfAccionesTwoDatasource datasource;
  InfAccionesTwoRepositoryImpl({required this.datasource});

  @override
  Future<InforAccionesResponseEntity> inforAcciones(
    String idPersonWeb,
    String idcInfoType,
    String idDpfMfInitial,
    String? vToken,
  ) async {
    return await datasource.infAccion(
      idPersonWeb,
      idcInfoType,
      idDpfMfInitial,
      vToken,
    );
  }
}
