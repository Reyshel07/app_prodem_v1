import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'get_favorites_event.dart';
part 'get_favorites_state.dart';

class GetFavoritesBloc extends Bloc<GetFavoritesEvent, GetFavoritesState> {
  GetFavoritesRepository repository;
  GetFavoritesBloc(this.repository) : super(GetFavoritesInitial()) {
    on<GetFavoritesEvent>(getFavoritesBloc);
  }
  //falta implementar
  Future<void> getFavoritesBloc(
    GetFavoritesEvent event,
    Emitter<GetFavoritesState> emit,
  ) async {
    if (event is GetFavEvent) {
      emit(GetFavoritesLoading());
      try {
        final token = SecureHive.readToken();
        String idUser = SecureHive.readIdUser();
        final response = await repository.getFavorites(
          token,
          idUser,
          event.accountType,
        );
        emit(GetFavoritesSuccess(response));
      } on BaseApiException catch (error) {
        switch (error.message) {
          case "api_logic_error":
            emit(GetFavoritesError(error.message));
          case "dio_unexpected":
            emit(GetFavoritesError("Ocurrio un error, no tiene internet"));
        }
      }
    }
  }
}
