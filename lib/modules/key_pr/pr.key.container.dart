import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/key_pr/data/datasource/key_pr_datasource.dart';
import 'package:app_prodem_v1/modules/key_pr/data/repositories/key_pr_repository_impl.dart';
import 'package:app_prodem_v1/modules/key_pr/domain/repositories/repository.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:get_it/get_it.dart';

void initKeyPr(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => KeyPrDatasource(apiClient));
  getIt.registerFactory<KeyPrRepository>(
    () => KeyPrRepositoryImpl(keyPrDatasource: getIt()),
  );
  getIt.registerFactory(() => CreatePrKeyBloc(getIt()));
  getIt.registerFactory(() => GetPrKeyByIdBloc(getIt()));
}
