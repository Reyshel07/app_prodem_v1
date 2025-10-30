import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'get_favorites_by_web_client_event.dart';
part 'get_favorites_by_web_client_state.dart';

class GetFavoritesByWebClientBloc
    extends Bloc<GetFavoritesByWebClientEvent, GetFavoritesByWebClientState> {
  GetFavoritesByWebClientRepository repository;
  GetFavoritesByWebClientBloc(this.repository)
    : super(GetFavoritesByWebClientInitial()) {
    on<GetFavoritesByWebCliEvent>(getFavoritesByWebClientBloc);
  }

  Future<void> getFavoritesByWebClientBloc(
    GetFavoritesByWebCliEvent event,
    Emitter<GetFavoritesByWebClientState> emit,
  ) async {
    emit(GetFavoritesByWebClientLoading());
    try {
      final token = SecureHive.readToken();
      String idWebClient = SecureHive.readIdWebPerson();
      final response = await repository.getFavoritesByWebClient(
        idWebClient,
        token,
      );
      emit(GetFavoritesByWebClientSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(GetFavoritesByWebClientError(error.message));
        case "dio_unexpected":
          emit(
            GetFavoritesByWebClientError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
