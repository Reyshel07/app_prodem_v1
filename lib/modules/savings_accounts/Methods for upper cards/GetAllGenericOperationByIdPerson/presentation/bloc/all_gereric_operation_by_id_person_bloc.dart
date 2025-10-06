import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/repository.dart';
part 'all_gereric_operation_by_id_person_event.dart';
part 'all_gereric_operation_by_id_person_state.dart';

class AllGerericOperationByIdPersonBloc
    extends
        Bloc<
          AllGenericOperationByIdPersonEvent,
          AllGenericOperationByIdPersonState
        > {
  AllGenericOperationByIdPersonRepository
  allGenericOperationByIdPersonRepository;
  AllGerericOperationByIdPersonBloc(
    this.allGenericOperationByIdPersonRepository,
  ) : super(AllGenericOperationByIdPersonInitial()) {
    on<AllGenericOperationByIdPersonEvent>(allGenericOperation);
  }

  Future<void> allGenericOperation(
    AllGenericOperationByIdPersonEvent event,
    Emitter<AllGenericOperationByIdPersonState> emit,
  ) async {
    emit(AllGenericOperationByIdPersonLoading());
    try {
      await allGenericOperationByIdPersonRepository
          .allGenericOperationByIdPerson();
      emit(AllGenericOperationByIdPersonSuccess('exit'));
    } catch (e) {
      emit(AllGenericOperationByIdPersonError('error'));
    }
  }
}
