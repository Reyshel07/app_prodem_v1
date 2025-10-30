import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'update_delete_favorite_event.dart';
part 'update_delete_favorite_state.dart';

class UpdateDeleteFavoriteBloc
    extends Bloc<UpdateDeleteFavoriteEvent, UpdateDeleteFavoriteState> {
  GetFavoritesByWebClientRepository repository;
  UpdateDeleteFavoriteBloc(this.repository)
    : super(UpdateDeleteFavoriteInitial()) {
    on<UpdateDeleteFavoEvent>(updateDeleteFavoriteBloc);
  }

  Future<void> updateDeleteFavoriteBloc(
    UpdateDeleteFavoEvent event,
    Emitter<UpdateDeleteFavoriteState> emit,
  ) async {
    emit(UpdateDeleteFavoriteLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.updateDeleteFavorite(
        event.idFavoritosServicios,
        event.favoriteName,
        event.delete,
        token,
      );
      emit(UpdateDeleteFavoriteSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(UpdateDeleteFavoritetError(error.message));
        case "dio_unexpected":
          emit(
            UpdateDeleteFavoritetError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
