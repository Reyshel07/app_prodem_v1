import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/data/datasource/payment_insurance_annuity_datasouerce.dart';
import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/data/repositories/payment_insurance_annuity_repository_impl.dart';
import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/domain/repositories/payment_insurance_annuity_repository.dart';
import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/presentation/bloc/payment_insurance_annuity_bloc.dart';
import 'package:get_it/get_it.dart';

void initPaymentInsuranceAnnuity(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => PaymentInsuranceAnnuityDatasouerce(apiClient),
  );
  getIt.registerFactory<PaymentInsuranceAnnuityRepository>(
    () => PaymentInsuranceAnnuityRepositoryImpl(datasouerce: getIt()),
  );
  getIt.registerFactory<PaymentInsuranceAnnuityBloc>(
    () => PaymentInsuranceAnnuityBloc(getIt()),
  );
}
