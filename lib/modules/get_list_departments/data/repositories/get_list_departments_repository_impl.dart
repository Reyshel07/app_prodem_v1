import 'package:app_prodem_v1/modules/get_list_departments/data/datasource/get_list_departments_datasource.dart';
import 'package:app_prodem_v1/modules/get_list_departments/domain/entities/get_list_departments_entity.dart';
import 'package:app_prodem_v1/modules/get_list_departments/domain/repositories/get_list_departments_repository.dart';

class GetListDepartmentsRepositoryImpl extends GetListDepartmentsRepository {
  GetListDepartmentsDatasource datasource;
  GetListDepartmentsRepositoryImpl({required this.datasource});

  @override
  Future<GetListDepartmentsResponseEntity> getListDepartments(
    String idWebPersonClient,
    String? vToken,
  ) {
    return datasource.getListDepartments(idWebPersonClient, vToken);
  }

  @override
  Future<GetListLocationDepartmentsResponseEntity> getListLocationDepartments(
    String idDepartment,
    String? vToken,
  ) async {
    return await datasource.getListLocationDepartments(idDepartment, vToken);
  }
}
