import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/domain/entities/get_parameters_to_digital_dpf_entity.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/domain/repositories/get_parameters_to_digital_dpf_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_office_list_by_id_geo_event.dart';
part 'get_office_list_by_id_geo_state.dart';

class GetOfficeListByIdGeoBloc
    extends Bloc<GetOfficeListByIdGeograEvent, GetOfficeListByIdGeoState> {
  final GetParametersToDigitalDpfRepository repository;

  GetOfficeListByIdGeoBloc(this.repository)
    : super(GetOfficeListByIdGeoInitial()) {
    on<GetOfficeListByIdGeoEvent>(_onGetOfficesByGeo);
  }

  /// Handler para traer oficinas por departamento (idGeo)
  Future<void> _onGetOfficesByGeo(
    GetOfficeListByIdGeoEvent event,
    Emitter<GetOfficeListByIdGeoState> emit,
  ) async {
    emit(GetOfficeListByIdGeoLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getOfficeListByIdGeo(
        event.idGeo.toString(),
        token,
      );

      emit(GetOfficeListByIdGeoSuccess(response.data));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(GetOfficeListByIdGeoError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(GetOfficeListByIdGeoError("Ocurrió un error, no tiene internet"));
      } else {
        emit(GetOfficeListByIdGeoError(error.message));
      }
    }
  }
}
