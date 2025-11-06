import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/domain/repositories/inf_acciones_two_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

part 'infor_acciones_two_event.dart';
part 'infor_acciones_two_state.dart';

class InforAccionesTwoBloc
    extends Bloc<InforAccionesTwoEvent, InforAccionesTwoState> {
  InfAccionesTwoRepository repository;
  InforAccionesTwoBloc(this.repository) : super(InforAccionesTwoInitial()) {
    on<InfAccionesTwo>(inforAccionesTwoBloc);
  }

  Future<void> inforAccionesTwoBloc(
    InfAccionesTwo event,
    Emitter<InforAccionesTwoState> emit,
  ) async {
    emit(InforAccionesTwoLoading());
    try {
      final token = SecureHive.readToken();
      final idPersonWeb = SecureHive.readIdWebPerson();
      final response = await repository.inforAcciones(
        idPersonWeb,
        event.idcInfoType,
        event.idDpfMfInitial,
        token,
      );
      emit(InforAccionesTwoSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(InforAccionesTwoError(error.message));
        case "dio_unexpected":
          emit(InforAccionesTwoError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
