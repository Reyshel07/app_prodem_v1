part of 'get_ach_banck_bloc.dart';

sealed class GetAchBanckEvent {}

class GEtAchBEvent extends GetAchBanckEvent {
  final String accountType;
  GEtAchBEvent({required this.accountType});
}
