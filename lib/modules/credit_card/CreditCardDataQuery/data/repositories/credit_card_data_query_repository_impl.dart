import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/data/datasource/credit_card_data_query_datasource.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/domain/entities/credit_card_data_query_entity.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/domain/repositories/credit_card_data_query_repository.dart';

class CreditCardDataQueryRepositoryImpl extends CreditCardDataQueryRepository {
  CreditCardDataQueryDatasource datasource;
  CreditCardDataQueryRepositoryImpl({required this.datasource});

  @override
  Future<CreditCardDataQueryResponseEntity> creditCardDataQuery(
    String? vToken,
    String? creditCardNumber,
    String? idPerson,
    String? idUser,
    String? imei,
    String? location,
    String? ipAddress,
  ) {
    return datasource.creditCardDataQuery(
      vToken,
      creditCardNumber,
      idPerson,
      idUser,
      imei,
      location,
      ipAddress,
    );
  }
}
