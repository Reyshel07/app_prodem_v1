part of 'pr_express_solicitation_web_bloc.dart';

sealed class PrExpressSolicitationWebState {}

final class PrExpressSolicitationWebInitial
    extends PrExpressSolicitationWebState {}

final class PrExpressSolicitationWebLoading
    extends PrExpressSolicitationWebState {}

final class PrExpressSolicitationWebError
    extends PrExpressSolicitationWebState {
  final String message;
  PrExpressSolicitationWebError(this.message);
}

final class PrExpressSolicitationWebSuccess
    extends PrExpressSolicitationWebState {
  final GetProdemExpressSolicitationWebResponseEntity
  getProdemExpressSolicitationWebResponseEntity;
  PrExpressSolicitationWebSuccess(
    this.getProdemExpressSolicitationWebResponseEntity,
  );
}

final class PrDeleteSuccess extends PrExpressSolicitationWebState {
  final ProdemExpressAnnulmentResponseEntity delete;
  PrDeleteSuccess(this.delete);
}
