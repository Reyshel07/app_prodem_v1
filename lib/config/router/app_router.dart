import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  //AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute1.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: AccountInquiryRoute.page),
    AutoRoute(page: SavingAccountExtractDataTranSacreen.page),
    AutoRoute(page: TransferFeesTwoRoute.page),
    AutoRoute(page: SavingAccountTransMobileEndRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: TransferRoute.page),
    AutoRoute(page: GetAchBanckListRoute.page),
    AutoRoute(page: GetAchDataRoute.page),
    AutoRoute(page: ExpressDataRoute.page),
    AutoRoute(page: PrExpressSolicitationWebRoute.page),
    AutoRoute(page: ReceiveTransfersByCellPhoneNumberRoute.page),
    AutoRoute(page: ParametersToDigitalDpfRoute.page),
    AutoRoute(page: GetListDpfDigitalSolicitationRoute.page),
    AutoRoute(page: LoanFlowAnnuitiesDetailDataForCreditRoute.page),
    AutoRoute(page: AdministracionRoute.page),
    AutoRoute(page: InforAccionesRoute.page),
    AutoRoute(page: GetEncriptedQrStringRoute.page),
    AutoRoute(page: LoanFlowGetCreditDetailDataForRecoveryRoute.page),
    AutoRoute(page: EncriptedQRRoute.page),
    AutoRoute(page: DecryptQrStringRoute.page),
    AutoRoute(page: DecryptQrRoute.page),
    AutoRoute(page: DecryptQrDetailsRoute.page),
    AutoRoute(page: ReportMovementByPErsonAndDateRoute.page),
    AutoRoute(page: CurrentQrByTypeRoute.page),

    AutoRoute(page: LoanFlowGetCreditDetailDataForRecoveryByCodeRoute.page),

    AutoRoute(page: AccountNumberlnOtherBankRoute.page),
    AutoRoute(page: CurrentQrByTypeTreeRoute.page),
    AutoRoute(page: CurrentQrByTypeTwoRoute.page),
    AutoRoute(page: ExternalPaymentGenerateFileWebClientRoute.page),
  ];
}
