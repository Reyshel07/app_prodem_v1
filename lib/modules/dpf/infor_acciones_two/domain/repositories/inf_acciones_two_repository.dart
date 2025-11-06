import '../entities/entity.dart';

abstract class InfAccionesTwoRepository {
  Future<InforAccionesResponseEntity> inforAcciones(
    String idPersonWeb,
    String idcInfoType,
    String idDpfMfInitial,
    String? vToken,
  );
}
