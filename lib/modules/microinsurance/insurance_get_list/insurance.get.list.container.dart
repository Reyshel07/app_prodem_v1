import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/microinsurance/insurance_get_list/data/repositories/insurance_get_list_repository_impl.dart';
import 'package:app_prodem_v1/modules/microinsurance/insurance_get_list/presentation/bloc/insurance_get_list_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';
import 'domain/repositories/repository.dart';

void initInsuranceGetList(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => InsuranceGetListDatasource(apiClient));
  getIt.registerFactory<InsuranceGetListRepository>(
    () => InsuranceGetListRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<InsuranceGetListBloc>(
    () => InsuranceGetListBloc(getIt()),
  );
}
