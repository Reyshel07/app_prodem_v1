import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/get_list_departments/domain/repositories/get_list_departments_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
part 'get_list_location_departments_event.dart';
part 'get_list_location_departments_state.dart';

class GetListLocationDepartmentsBloc
    extends
        Bloc<GetListLocationDepartmentsEvent, GetListLocationDepartmentsState> {
  GetListDepartmentsRepository repository;
  GetListLocationDepartmentsBloc(this.repository)
    : super(GetListLocationDepartmentsInitial()) {
    on<GetListLocationDepartmenEvent>(getListLocationDepartmentsBloc);
  }
  Future<void> getListLocationDepartmentsBloc(
    GetListLocationDepartmenEvent event,
    Emitter<GetListLocationDepartmentsState> emit,
  ) async {
    emit(GetListLocationDepartmentsLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getListLocationDepartments(
        event.idDepartment,
        token,
      );
      emit(GetListLocationDepartmentsSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetListLocationDepartmentsError(error.message));
        case "dio_unexpected":
          emit(
            GetListLocationDepartmentsError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
