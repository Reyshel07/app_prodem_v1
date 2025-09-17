import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class DataAccountForMobilesByCodeAccountAllRepositoryImpl
    extends DataAccountForMobilesByCodeAccountAllRepository {
  DataAccountForMobilesByCodeAccountAllDatasource datasource;
  DataAccountForMobilesByCodeAccountAllRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<GetDataAccountForMobilesByCodeAccountAllResponseEntity>
  dataAccountForMobiles() async {
    return await datasource.dataAccountForMobileByCodeAccountAll();
  }
}
