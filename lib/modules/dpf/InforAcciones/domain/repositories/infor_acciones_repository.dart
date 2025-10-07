import '../entities/entity.dart';

abstract class InforAccionesRepository {
  Future<InforAccionesResponseEntity> inforAcciones(
    String idPersonWeb,
    String idcInfoType,
    String idDpfMfInitial,
    String? vToken,
  );
}
