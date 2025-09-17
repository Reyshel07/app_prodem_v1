import '../entities/entity.dart';

abstract class GenericOperationByIdPersonAndTypeRepository {
  Future<GetGenericOperationByIdPersonAndTypeResponseEntity>
  genericOperationByIdPersonAndType();
}
