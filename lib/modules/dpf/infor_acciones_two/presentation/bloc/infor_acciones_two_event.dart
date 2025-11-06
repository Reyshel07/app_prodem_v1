part of 'infor_acciones_two_bloc.dart';

sealed class InforAccionesTwoEvent {}

class InfAccionesTwo extends InforAccionesTwoEvent {
  final String idcInfoType;
  final String idDpfMfInitial;
  InfAccionesTwo({required this.idDpfMfInitial, required this.idcInfoType});
}
