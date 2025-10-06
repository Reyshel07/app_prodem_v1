import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GenericOperationByIdPersonAndTypeRepositoryImpl
    extends GenericOperationByIdPersonAndTypeRepository {
  GenericOperationByIdPersonAndTypeDatasource datasource;
  GenericOperationByIdPersonAndTypeRepositoryImpl({required this.datasource});

  @override
  Future<GetGenericOperationByIdPersonAndTypeResponseEntity>
  genericOperationByIdPersonAndType() async {
    return await datasource.genericOperationByIdPerAndType();
  }
}
