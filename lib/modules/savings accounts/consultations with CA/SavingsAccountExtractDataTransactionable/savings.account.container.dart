import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'presentation/bloc/bloc.dart';

void initSavingsAccountContainer(GetIt getIt) {
  getIt.registerLazySingleton(() => SavingAccountExtracDatasource());
  getIt.registerFactory<SavingAccountExtracRespository>(
    () => SavingAccountExtracImpl(savingAccountExtracDatasource: getIt()),
  );
  getIt.registerFactory(() => SavingAccountExtracBloc(getIt()));
}
