part of 'get_pr_key_by_id_bloc.dart';

sealed class GetPrKeyByIdEvent {}

final class GetPrKeyEvent extends GetPrKeyByIdEvent {
  final String idSmsOperation;
  GetPrKeyEvent({required this.idSmsOperation});
}
