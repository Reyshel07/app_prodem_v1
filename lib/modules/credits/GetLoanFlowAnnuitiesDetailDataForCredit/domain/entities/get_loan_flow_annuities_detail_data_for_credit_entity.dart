
class GetLoanFlowAnnuitiesDetailDataForCreditResponseEntity {
    final GetLoanFlowAnnuitiesDetailDataForCreditEntity data;
    final int state;
    final String message;

    GetLoanFlowAnnuitiesDetailDataForCreditResponseEntity({
        required this.data,
        required this.state,
        required this.message,
    });

}

class GetLoanFlowAnnuitiesDetailDataForCreditEntity {
    final double idLoanCredit;
    final String loanCreditCode;
    final int idLoanCurrency;
    final String loanCurrency;
    final int idCreditState;
    final String creditState;
    final int delayDays;
    final int creditAmount;
    final List<ColAnnuitiesDetail> colAnnuitiesDetail;
    final String customerName;
    final String identityCard;

    GetLoanFlowAnnuitiesDetailDataForCreditEntity({
        required this.idLoanCredit,
        required this.loanCreditCode,
        required this.idLoanCurrency,
        required this.loanCurrency,
        required this.idCreditState,
        required this.creditState,
        required this.delayDays,
        required this.creditAmount,
        required this.colAnnuitiesDetail,
        required this.customerName,
        required this.identityCard,
    });

}

class ColAnnuitiesDetail {
    final int idLoanCreditAnnuity;
    final String annuityNumber;
    final DateTime annuityEndDate;
    final double annuityBalance;
    final int daysDelayed;
    final bool isPaid;

    ColAnnuitiesDetail({
        required this.idLoanCreditAnnuity,
        required this.annuityNumber,
        required this.annuityEndDate,
        required this.annuityBalance,
        required this.daysDelayed,
        required this.isPaid,
    });
}
