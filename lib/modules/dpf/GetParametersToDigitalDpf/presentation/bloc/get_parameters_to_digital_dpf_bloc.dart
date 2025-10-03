import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/domain/repositories/get_parameters_to_digital_dpf_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'get_parameters_to_digital_dpf_event.dart';
part 'get_parameters_to_digital_dpf_state.dart';

class GetParametersToDigitalDpfBloc
    extends
        Bloc<GetParametersToDigitalDpfEvent, GetParametersToDigitalDpfState> {
  final GetParametersToDigitalDpfRepository repository;

  GetParametersToDigitalDpfBloc(this.repository)
    : super(GetParametersToDigitalDpfInitial()) {
    on<GetParametersToDigDpfEvent>(_onGetParameters);
  }

  /// Handler para cargar parámetros iniciales del DPF
  Future<void> _onGetParameters(
    GetParametersToDigDpfEvent event,
    Emitter<GetParametersToDigitalDpfState> emit,
  ) async {
    emit(GetParametersToDigitalDpfLoading());
    try {
      const String idFather = '3000001';

      final token = SecureHive.readToken();

      final response = await repository.getParametersToDigitalDpf(
        idFather,
        event.isEmployee,
        token,
      );

      emit(GetParametersToDigitalDpfSuccess(response));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(GetParametersToDigitalDpfError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(
          GetParametersToDigitalDpfError("Ocurrió un error, no tiene internet"),
        );
      } else {
        emit(GetParametersToDigitalDpfError(error.message));
      }
    }
  }
}
