import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/data/datasource/credit_card_data_query_datasource.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/data/repositories/credit_card_data_query_repository_impl.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/domain/repositories/credit_card_data_query_repository.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/presentation/bloc/credit_card_data_query_bloc.dart';
import 'package:get_it/get_it.dart';

void initCreditCardDataQuery(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => CreditCardDataQueryDatasource(apiClient));
  getIt.registerFactory<CreditCardDataQueryRepository>(
    () => CreditCardDataQueryRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => CreditCardDataQueryBloc(getIt()));
}
