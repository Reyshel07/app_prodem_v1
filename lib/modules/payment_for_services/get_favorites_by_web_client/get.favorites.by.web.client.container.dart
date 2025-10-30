import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/payment_for_services/get_favorites_by_web_client/presentation/bloc/get_favorites_by_web_client_bloc.dart';
import 'package:app_prodem_v1/modules/payment_for_services/get_favorites_by_web_client/presentation/bloc/update_delete_favorite_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/get_favorites_by_web_client_repository_impl.dart';
import 'domain/repositories/repository.dart';

void initGetFavoritesByWebClient(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetFavoritesByWebClientDatasource(apiClient),
  );
  getIt.registerFactory<GetFavoritesByWebClientRepository>(
    () => GetFavoritesByWebClientRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => GetFavoritesByWebClientBloc(getIt()));
  getIt.registerFactory(() => UpdateDeleteFavoriteBloc(getIt()));
}
