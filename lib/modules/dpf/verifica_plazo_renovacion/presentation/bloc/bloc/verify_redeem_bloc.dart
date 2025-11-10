import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entity.dart';
import '../../../domain/repositories/repository.dart';

part 'verify_redeem_event.dart';
part 'verify_redeem_state.dart';

class VerifyRedeemBloc extends Bloc<VerifyRedeemEvent, VerifyRedeemState> {
  VerificaPlazoRenovacionRepository repository;
  VerifyRedeemBloc(this.repository) : super(VerifyRedeemInitial()) {
    on<VerifyRedEvent>(verifyRedeemBloc);
  }
  Future<void> verifyRedeemBloc(
    VerifyRedEvent event,
    Emitter<VerifyRedeemState> emit,
  ) async {
    emit(VerifyRedeemLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.verifyRedeem(event.term, token);
      emit(VerifyRedeemSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(VerifyRedeemError(error.message));
        case "dio_unexpected":
          emit(VerifyRedeemError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
