import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/referenced/insert_web_references/data/repositories/insert_web_references_repository_impl.dart';
import 'package:app_prodem_v1/modules/referenced/insert_web_references/presentation/bloc/insert_web_references_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';
import 'domain/repositories/repository.dart';

void initInsertWebReferences(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => InsertWebReferencesDatasource(apiClient));
  getIt.registerFactory<InsertWebReferencesRepository>(
    () => InsertWebReferencesRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<InsertWebReferencesBloc>(
    () => InsertWebReferencesBloc(getIt()),
  );
}
