part of 'get_bank_guarantee_class_bloc.dart';

sealed class GetBankGuaranteeClassEvent {}

class GetBankGuarClassEvent extends GetBankGuaranteeClassEvent {
  final bool isPublic;
  GetBankGuarClassEvent({required this.isPublic});
}
