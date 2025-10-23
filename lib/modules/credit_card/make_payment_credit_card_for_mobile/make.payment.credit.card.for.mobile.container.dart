import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credit_card/make_payment_credit_card_for_mobile/presentation/bloc/make_payment_credit_card_for_mobile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/make_payment_credit_card_for_mobile_repositori_impl.dart';
import 'domain/repositories/repository.dart';

void initMakePaymentCreditCardForMobile(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => MakePaymentCreditCardForMobileDatasource(apiClient),
  );
  getIt.registerFactory<MakePaymentCreditCardForMobileRepository>(
    () => MakePaymentCreditCardForMobileRepositoriImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => MakePaymentCreditCardForMobileBloc(getIt()));
}
