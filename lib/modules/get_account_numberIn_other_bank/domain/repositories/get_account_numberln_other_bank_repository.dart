import '../entities/entity.dart';

abstract class GetAccountNumberlnOtherBankRepository {
  Future<GetAccountNumberInOtherBankResponseEntity> accountNumberlnOtherBank(
    String? vToken,
  );
}
