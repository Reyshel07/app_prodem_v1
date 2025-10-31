import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_list_departments/data/models/get_list_departments_model.dart';

import '../../domain/entities/entity.dart';

class GetListDepartmentsDatasource {
  final ApiClient _apiClient;
  GetListDepartmentsDatasource(this._apiClient);

  Future<GetListDepartmentsResponseEntity> getListDepartments(
    String idWebPersonClient,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getListDepartments,
      operationName: 'service obtained by departments',
      data: {"IdWebPersonClient": idWebPersonClient},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetListDepartmentsResponseModel.fromJson(response);
  }

  Future<GetListLocationDepartmentsResponseEntity> getListLocationDepartments(
    String idDepartment,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getListLocationDepartments,
      operationName: 'service obtained by departments',
      data: {"IdDepartment": idDepartment},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetListLocationDepartmentsResponseModel.fromJson(response);
  }
}
