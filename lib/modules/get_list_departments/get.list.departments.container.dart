import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_list_departments/data/datasource/get_list_departments_datasource.dart';
import 'package:app_prodem_v1/modules/get_list_departments/data/repositories/get_list_departments_repository_impl.dart';
import 'package:app_prodem_v1/modules/get_list_departments/domain/repositories/get_list_departments_repository.dart';
import 'package:app_prodem_v1/modules/get_list_departments/presentation/bloc/get_list_departments_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetListDepartments(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => GetListDepartmentsDatasource(apiClient));
  getIt.registerFactory<GetListDepartmentsRepository>(
    () => GetListDepartmentsRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<GetListDepartmentsBloc>(
    () => GetListDepartmentsBloc(getIt()),
  );
}
