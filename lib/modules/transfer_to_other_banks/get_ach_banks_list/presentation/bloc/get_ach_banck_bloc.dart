import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/domain/repositories/get_ach_banck_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

part 'get_ach_banck_event.dart';
part 'get_ach_banck_state.dart';

class GetAchBanckBloc extends Bloc<GetAchBanckEvent, GetAchBanckState> {
  GetAchBanckRepository repository;
  GetAchBanckBloc(this.repository) : super(GetAchBanckInitial()) {
    on<GEtAchBEvent>(getAchBanckBloc);
  }

  Future<void> getAchBanckBloc(
    GEtAchBEvent event,
    Emitter<GetAchBanckState> emit,
  ) async {
    emit(GetAchBanckLoading());
    try {
      String idUser =SecureHive.readIdUser();// '350880';
      final token = SecureHive.readToken();
      final response = await repository.getAchBanck(
        idUser,
        event.accountType,
        token,
      );
      emit(GetAchBanckSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetAchBanckError(error.message));
        case "dio_unexpected":
          emit(GetAchBanckError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
