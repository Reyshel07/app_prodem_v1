import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:get_it/get_it.dart';
import 'sign_in/data/datasource/datasource.dart';
import 'sign_in/data/repositories/repositories_impl.dart';
import 'sign_in/domain/repositories/repositories.dart';
import 'sign_in/presentation/bloc/bloc.dart';

void initAuthContainer(GetIt getIt) {
  var apiClient = ApiClient();
  //Datasource
  getIt.registerLazySingleton(() => SignInDatasource(apiClient));
  //repository
  getIt.registerFactory<SignInResponseRepository>(
    () => SignInResponseRepositoryImpl(datasource: getIt()),
  );
  //Bloc
  getIt.registerFactory(() => AuthBloc(getIt()));
}
