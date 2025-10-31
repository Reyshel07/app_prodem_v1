import '../entities/entity.dart';

abstract class GetListDepartmentsRepository {
  Future<GetListDepartmentsResponseEntity> getListDepartments(
    String idWebPersonClient,
    String? vToken,
  );
  Future<GetListLocationDepartmentsResponseEntity> getListLocationDepartments(
    String idDepartment,
    String? vToken,
  );
}
