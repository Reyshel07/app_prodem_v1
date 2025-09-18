import 'package:get_it/get_it.dart';
import 'sign_in/data/datasource/datasource.dart';
import 'sign_in/data/repositories/repositories_impl.dart';
import 'sign_in/domain/repositories/repositories.dart';
import 'sign_in/presentation/bloc/bloc.dart';

void initAuthContainer(GetIt getIt) {
  //Datasource
  getIt.registerLazySingleton(() => SignInDatasource());
  //repository
  getIt.registerFactory<SignInResponseRepository>(
    () => SignInResponseRepositoryImpl(datasource: getIt()),
  );
  //Bloc
  getIt.registerFactory(() => AuthBloc(getIt()));
}
