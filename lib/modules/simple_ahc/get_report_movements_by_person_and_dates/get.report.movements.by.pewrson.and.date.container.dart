import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/data/datasource/report_movements_by_person_and_dates_datasource.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/data/repositories/report_movements_by_person_and_dates_repository_impl.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/domain/repositories/report_movements_by_person_and_dates_repository.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/presentation/bloc/report_movement_by_person_and_date_bloc.dart';
import 'package:get_it/get_it.dart';

void initReportMovementsByPersonAndDate(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => ReportMovementsByPersonAndDatesDatasource(apiClient),
  );
  getIt.registerFactory<ReportMovementsByPersonAndDatesRepository>(
    () => ReportMovementsByPersonAndDatesRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => ReportMovementByPersonAndDateBloc(getIt()));
}
