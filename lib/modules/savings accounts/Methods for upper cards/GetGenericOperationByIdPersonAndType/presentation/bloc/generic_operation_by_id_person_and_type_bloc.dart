import 'package:flutter_bloc/flutter_bloc.dart';
part 'generic_operation_by_id_person_and_type_event.dart';
part 'generic_operation_by_id_person_and_type_state.dart';

class GenericOperationByIdPersonAndTypeBloc
    extends
        Bloc<
          GenericOperationByIdPersonAndTypeEvent,
          GenericOperationByIdPersonAndTypeState
        > {
  GenericOperationByIdPersonAndTypeBloc()
    : super(GenericOperationByIdPersonAndTypeInitial()) {
    on<GenericOperationByIdPersonAndTypeEvent>((event, emit) {});
  }
}
