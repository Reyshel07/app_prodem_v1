part of 'all_gereric_operation_by_id_person_bloc.dart';

sealed class AllGenericOperationByIdPersonState {}

final class AllGenericOperationByIdPersonInitial
    extends AllGenericOperationByIdPersonState {}

final class AllGenericOperationByIdPersonLoading
    extends AllGenericOperationByIdPersonState {}

final class AllGenericOperationByIdPersonError
    extends AllGenericOperationByIdPersonState {
  final String message;
  AllGenericOperationByIdPersonError(this.message);
}

final class AllGenericOperationByIdPersonSuccess
    extends AllGenericOperationByIdPersonState {
  final String mesage;
  AllGenericOperationByIdPersonSuccess(this.mesage);
}
