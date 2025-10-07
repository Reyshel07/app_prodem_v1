import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/domain/entities/infor_acciones_entity.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/domain/repositories/infor_acciones_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'infor_acciones_event.dart';
part 'infor_acciones_state.dart';

class InforAccionesBloc extends Bloc<InforAccionesEvent, InforAccionesState> {
  InforAccionesRepository repository;
  InforAccionesBloc(this.repository) : super(InforAccionesInitial()) {
    on<InfAccionEvent>(inforAcciones);
  }

  Future<void> inforAcciones(
    InfAccionEvent event,
    Emitter<InforAccionesState> emit,
  ) async {
    emit(InforAccionesLoading());
    try {
      String idWebPersonClient = SecureHive.readIdWebPerson();
      final token = SecureHive.readToken();
      String idcInfoType = '0';
      String idDpfMfInitial = '0';
      final response = await repository.inforAcciones(
        idWebPersonClient,
        idcInfoType,
        idDpfMfInitial,
        token,
      );
      emit(
        InforAccionesSuccess(response.data, response.data.first.dpfExpiracion),
      );
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(InforAccionesError(error.message));
        case "dio_unexpected":
          emit(InforAccionesError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
