part of 'credit_card_data_query_bloc.dart';

sealed class CreditCardDataQueryState {}

final class CreditCardDataQueryInitial extends CreditCardDataQueryState {}

final class CreditCardDataQueryLoading extends CreditCardDataQueryState {}

final class CreditCardDataQueryError extends CreditCardDataQueryState {
  final String message;
  CreditCardDataQueryError(this.message);
}

final class CreditCardDataQuerySuccess extends CreditCardDataQueryState {
  final CreditCardDataQueryEntity creditCardDataQueryEntity;
  CreditCardDataQuerySuccess(this.creditCardDataQueryEntity);
}
