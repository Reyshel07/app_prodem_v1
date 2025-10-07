import 'package:app_prodem_v1/modules/dpf/InforAcciones/data/datasource/infor_acciones_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/domain/entities/infor_acciones_entity.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/domain/repositories/infor_acciones_repository.dart';

class InforAccionesRepositoryImpl extends InforAccionesRepository {
  InforAccionesDatasource datasource;
  InforAccionesRepositoryImpl({required this.datasource});

  @override
  Future<InforAccionesResponseEntity> inforAcciones(
    String idPersonWeb,
    String idcInfoType,
    String idDpfMfInitial,
    String? vToken,
  ) async {
    return await datasource.inforAccion(
      idPersonWeb,
      idcInfoType,
      idDpfMfInitial,
      vToken,
    );
  }
}
