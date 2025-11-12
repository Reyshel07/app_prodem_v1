import '../entities/entity.dart';

abstract class GetTicketsInformationMobileRepository {
  Future<GetTicketsInformationMobileResponseEntity> getTicketsInformationMobile(
    String codeAccount,
    String? vToken,
  );
}
