import 'package:app_prodem_v1/modules/auth/auth.container.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/get_loan_flow_annuities_detail_data_for_credit_injector.container.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/loan_flow_get_credit_detail_data_for_recovery_injector.container.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/loan_flow_get_credit_detail_data_for_recovery_by_code_injector.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/get.list.dpf.digital.solicitation.container.dart';
import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/create.dpf.solicitation.intenal.container.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/get.parameters.to.digital.dpf.container.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/infor.acciones.container.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/account.numberln.other.bank.container.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/get.current.qr.by.type.container.dart';
import 'package:app_prodem_v1/modules/get_external_payment_generate_file_by_web_client/get.external.payment.generate.file.web.client.container.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressData/express.data.container.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/pr.express.soli.web.container.dart';
import 'package:app_prodem_v1/modules/home/settings_screen/get_account_enabled_to_transfer/receive.transfer.by.to.transfer.container.dart';
import 'package:app_prodem_v1/modules/lightning_turn/prodem_express_save_solicitation/prodem.expres.save.solitation.container.dart';
import 'package:app_prodem_v1/modules/list_get_other_account_deposit/list.get.other.account.deposit.container.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/save.online.third.deposit.container.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/decrypt.qr.string.container.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/get.encripted.qr.string.container.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/get.report.movements.by.pewrson.and.date.container.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/payment.qr.string.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/get.ach.bank.list.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/injector.container.dart';
import 'package:app_prodem_v1/modules/home/GetAccountBalances/account.balances.container.dart';
import 'package:app_prodem_v1/modules/home/savingsAccountExtractDataTransactionable/savings.account.container.dart';
import 'package:app_prodem_v1/modules/key_pr/pr.key.container.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/saving_account_data_container.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/saving.account.transfer.mobile.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/get.ach.data.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/get.valid.account.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/transfer.ach.from.mobile.container.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'config/router/router.dart';

///central container
class InjectorContainer {
  InjectorContainer();

  static final getIt = GetIt.instance;

  static setupGetIt() {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerSingleton<AppRouter>(AppRouter());
    initAuthContainer(getIt);
    initUserSessionInfo(getIt);
    initAccountsBalances(getIt);
    initSavingsAccountExtrcContainer(getIt);
    initSavingAccountData(getIt);
    initKeyPr(getIt);
    initSavingAccountTransMobile(getIt);
    initGetAchBankList(getIt);
    initGetValidAccount(getIt);
    initGEtAchData(getIt);
    inittransferAchFromMobileBanking(getIt);
    initExpressData(getIt);
    initPrExpressSoliWeb(getIt);
    initGetAccountEnableToTransfer(getIt);
    initGetParametersToDigitalDpf(getIt);
    initGetListDigitalSolicitation(getIt);
    initCreateDpfSolicitationInternal(getIt);
    initGetLoanFlowAnnDetDataForCredit(getIt);
    initLoanFlowGetCreditDetailDataForRecovery(getIt);
    initInforAcciones(getIt);
    initGEtEncriptedQrString(getIt);
    initDecryptQrString(getIt);
    initCurrentQrByType(getIt);
    initLoanFlowGetCreditDetailDataForRecoveryByCode(getIt);
    initReportMovementsByPersonAndDate(getIt);
    initAccountNumberlnOtherBank(getIt);
    initListGetOtherAccountDeposit(getIt);
    initSaveOnlineThirdDeposit(getIt);
    initGetExternalPaymentGenerateFileWebClient(getIt);
    initPrExpressSaveSolicitation(getIt);
    initPaymentQrString(getIt);
  }
}
