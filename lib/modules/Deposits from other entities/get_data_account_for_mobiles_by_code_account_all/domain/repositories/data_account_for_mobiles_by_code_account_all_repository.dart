import '../entities/entity.dart';

abstract class DataAccountForMobilesByCodeAccountAllRepository {
  Future<GetDataAccountForMobilesByCodeAccountAllResponseEntity>
  dataAccountForMobiles(String codeAccount, vToken);
}
