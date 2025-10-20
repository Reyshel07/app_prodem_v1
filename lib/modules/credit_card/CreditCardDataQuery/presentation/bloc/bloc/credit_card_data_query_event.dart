part of 'credit_card_data_query_bloc.dart';

sealed class CreditCardDataQueryEvent {}

class CreditCardDataQueryE extends CreditCardDataQueryEvent {
    String? creditCardNumber;

    CreditCardDataQueryE({required this.creditCardNumber});
}
