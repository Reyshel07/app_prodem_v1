import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/key_pr/domain/repositories/repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
part 'get_pr_key_by_id_event.dart';
part 'get_pr_key_by_id_state.dart';

class GetPrKeyByIdBloc extends Bloc<GetPrKeyByIdEvent, GetPrKeyByIdState> {
  KeyPrRepository keyPrRepository;
  GetPrKeyByIdBloc(this.keyPrRepository) : super(GetPrKeyByIdInitial()) {
    on<GetPrKeyEvent>(getPrKey);
  }

  Future<void> getPrKey(
    GetPrKeyEvent event,
    Emitter<GetPrKeyByIdState> emit,
  ) async {
    emit(GetPrKeyByIdLoading());
    try {
      final token = SecureHive.readToken();
      final response = await keyPrRepository.getPrKeyById(
        event.idSmsOperation,
        token,
      );
      emit(GetPrKeyByIdSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(GetPrKeyByIdError(error.message));
        case "dio_unexpected":
          emit(GetPrKeyByIdError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
