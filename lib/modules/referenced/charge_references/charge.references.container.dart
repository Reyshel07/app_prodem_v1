import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/referenced/charge_references/data/repositories/charge_references_repository_impl.dart';
import 'package:app_prodem_v1/modules/referenced/charge_references/domain/repositories/charge_references_repository.dart';
import 'package:app_prodem_v1/modules/referenced/charge_references/presentation/bloc/charge_references_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';

void initChargeReferences(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => ChargeReferencesDatasource(apiClient));
  getIt.registerFactory<ChargeReferencesRepository>(
    () => ChargeReferencesRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<ChargeReferencesBloc>(
    () => ChargeReferencesBloc(getIt()),
  );
}
