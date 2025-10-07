part of 'infor_acciones_bloc.dart';

sealed class InforAccionesState {}

final class InforAccionesInitial extends InforAccionesState {}

final class InforAccionesLoading extends InforAccionesState {}

final class InforAccionesError extends InforAccionesState {
  final String message;
  InforAccionesError(this.message);
}

final class InforAccionesSuccess extends InforAccionesState {
  List<InforAccionesEntity> inforAccionesEntity;
  List<DpfExpiracionEntity>? dpfExpiracion;
  InforAccionesSuccess(this.inforAccionesEntity, this.dpfExpiracion);
}
