part of 'insurance_get_list_bloc.dart';

sealed class InsuranceGetListEvent {}

class InsurGetListEvent extends InsuranceGetListEvent {
  final String identityCardNumber;
  InsurGetListEvent({required this.identityCardNumber});
}
