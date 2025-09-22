import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'presentation/bloc/bloc.dart';

void initSavingsAccountExtrcContainer(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => SavingAccountExtracDatasource(apiClient));
  getIt.registerFactory<SavingAccountExtracRespository>(
    () => SavingAccountExtracImpl(savingAccountExtracDatasource: getIt()),
  );
  getIt.registerFactory(() => SavingAccountExtracBloc(getIt()));
}
