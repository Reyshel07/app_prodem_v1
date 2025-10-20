import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/domain/entities/credit_card_data_query_entity.dart';

abstract class CreditCardDataQueryRepository {
  Future<CreditCardDataQueryResponseEntity> creditCardDataQuery(
    String? vToken,
    String? creditCardNumber,
    String? idPerson,
    String? idUser,
    String? imei,
    String? location,
    String? ipAddress,
  );
}