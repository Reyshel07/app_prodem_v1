import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/respository_impl.dart';
import 'domain/repositories/repository.dart';
import 'presentation/bloc/bloc.dart';

void initAccountsBalances(GetIt getIt) {
  getIt.registerLazySingleton(() => AccountBalancesDatasource());
  getIt.registerFactory<AccountBalancesRespositoriy>(
    () => AccountBalancesRespositoryImpl(accountBalancesDatasource: getIt()),
  );
  getIt.registerFactory(() => AccountBalanceBloc(getIt()));
}
