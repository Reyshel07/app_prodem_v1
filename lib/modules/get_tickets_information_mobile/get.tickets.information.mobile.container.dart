import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_tickets_information_mobile/data/repositories/get_tickets_information_mobile_repository_impl.dart';
import 'package:app_prodem_v1/modules/get_tickets_information_mobile/presentation/bloc/get_tickets_information_mobile_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';
import 'domain/repositories/repository.dart';

void initGetTicketsInformationMobile(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetTicketsInformationMobileDatasource(apiClient),
  );
  getIt.registerFactory<GetTicketsInformationMobileRepository>(
    () => GetTicketsInformationMobileRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => GetTicketsInformationMobileBloc(getIt()));
}
