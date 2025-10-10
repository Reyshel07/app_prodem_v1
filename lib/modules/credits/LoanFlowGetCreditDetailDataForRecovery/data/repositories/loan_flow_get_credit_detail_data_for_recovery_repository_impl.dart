import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/data/datasource/loan_flow_get_credit_detail_data_for_recovery_datasource.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/entities/loan_flow_get_credit_detail_data_for_recovery_entity.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/repositories/loan_flow_get_credit_detail_data_for_recovery_repository.dart';

class LoanFlowGetCreditDetailDataForRecoveryRepositoryImpl extends LoanFlowGetCreditDetailDataForRecoveryRepository {

  LoanFlowGetCreditDetailDataForRecoveryDatasource datasource;
  LoanFlowGetCreditDetailDataForRecoveryRepositoryImpl ({required this.datasource});

  @override
  Future<LoanFlowGetCreditDetailDataForRecoveryResponseEntity> loanFlowGetCreDetDatForRecovery(
    String? vToken,
    String? idLoanCredit,
    String? idSavingAccount
  ){
    return datasource.loanFlowGetCretidDetDatForRecovery(vToken, idLoanCredit, idSavingAccount);
  }

//   @override
// Future<LoanFlowGetCreditDetailDataForRecoveryResponseEntity>
//     loanFlowGetCreDetDatForRecovery(
//   String? vToken,
//   String? idLoanCredit,
//   String? idSavingAccount,
// ) async {
//   try {
//     //  Llamamos al datasource
//     final result = await datasource.loanFlowGetCretidDetDatForRecovery(
//       vToken,
//       idLoanCredit,
//       idSavingAccount,
//     );

//     //  Si llega hasta aquí, el datasource respondió bien
//     print(' Repositorio recibió: ${result.toString()}');
//     return result;
//   } on BaseApiException catch (e, stack) {
//     // ⚠️ Si el ApiClient lanza un BaseApiException, lo capturamos aquí
//     print(' BaseApiException en Repositorio: ${e.message}');
//     print(' Stacktrace: $stack');
//     rethrow; // ← Lo relanzas para que el Bloc pueda manejarlo
//   } catch (e, stack) {
//     //  Cualquier otro error inesperado
//     print('Error inesperado en Repositorio: $e');
//     print(' Stacktrace: $stack');
//     rethrow;
//   }
// }
}