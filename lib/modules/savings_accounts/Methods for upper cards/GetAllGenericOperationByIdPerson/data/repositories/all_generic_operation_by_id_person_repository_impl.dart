import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class AllGenericOperationByIdPersonRepositoryImpl
    extends AllGenericOperationByIdPersonRepository {
  AllGenericOperationByIdPersonDatasource datasource;
  AllGenericOperationByIdPersonRepositoryImpl({required this.datasource});

  @override
  Future<GetAllGenericOperationByIdPersonResponseEntity>
  allGenericOperationByIdPerson() async {
    return await datasource.allGenericOprationByIdPerson();
  }
}
