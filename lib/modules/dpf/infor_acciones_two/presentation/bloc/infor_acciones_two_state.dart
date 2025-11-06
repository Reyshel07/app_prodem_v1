part of 'infor_acciones_two_bloc.dart';

sealed class InforAccionesTwoState {}

final class InforAccionesTwoInitial extends InforAccionesTwoState {}

final class InforAccionesTwoLoading extends InforAccionesTwoState {}

final class InforAccionesTwoError extends InforAccionesTwoState {
  final String message;
  InforAccionesTwoError(this.message);
}

final class InforAccionesTwoSuccess extends InforAccionesTwoState {
  final List<InforAccionesEntity> inforAccionesEntity;
  InforAccionesTwoSuccess(this.inforAccionesEntity);
}
