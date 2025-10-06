
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/domain/entities/get_loan_flow_annuities_detail_data_for_credit_entity.dart';
import 'dart:convert';

GetLoanFlowAnnuitiesDetailDataForCreditResponseModel getLoanFlowAnnuitiesDetailDataForCreditFromJson(String str) => GetLoanFlowAnnuitiesDetailDataForCreditResponseModel.fromJson(json.decode(str));

class GetLoanFlowAnnuitiesDetailDataForCreditResponseModel extends GetLoanFlowAnnuitiesDetailDataForCreditResponseEntity {

    GetLoanFlowAnnuitiesDetailDataForCreditResponseModel({
        required super.data,
        required super.state,
        required super.message,
    });

    factory GetLoanFlowAnnuitiesDetailDataForCreditResponseModel.fromJson(Map<String, dynamic> json) => GetLoanFlowAnnuitiesDetailDataForCreditResponseModel(
        data: GetLoanFlowAnnuitiesDetailDataForCreditModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
    );

}

class GetLoanFlowAnnuitiesDetailDataForCreditModel extends  GetLoanFlowAnnuitiesDetailDataForCreditEntity{

    GetLoanFlowAnnuitiesDetailDataForCreditModel({
        required super.idLoanCredit,
        required super.loanCreditCode,
        required super.idLoanCurrency,
        required super.loanCurrency,
        required super.idCreditState,
        required super.creditState,
        required super.delayDays,
        required super.creditAmount,
        required super.colAnnuitiesDetail,
        required super.customerName,
        required super.identityCard,
    });

    factory GetLoanFlowAnnuitiesDetailDataForCreditModel.fromJson(Map<String, dynamic> json) => GetLoanFlowAnnuitiesDetailDataForCreditModel(
        idLoanCredit: json["idLoanCredit"]?.toDouble(),
        loanCreditCode: json["loanCreditCode"],
        idLoanCurrency: json["idLoanCurrency"],
        loanCurrency: json["loanCurrency"],
        idCreditState: json["idCreditState"],
        creditState: json["creditState"],
        delayDays: json["delayDays"],
        creditAmount: json["creditAmount"],
        colAnnuitiesDetail: List<ColAnnuitiesDetailModel>.from(json["colAnnuitiesDetail"].map((x) => ColAnnuitiesDetailModel.fromJson(x))),
        customerName: json["customerName"],
        identityCard: json["identityCard"],
    );

}

class ColAnnuitiesDetailModel extends ColAnnuitiesDetail{

    ColAnnuitiesDetailModel({
        required super.idLoanCreditAnnuity,
        required super.annuityNumber,
        required super.annuityEndDate,
        required super.annuityBalance,
        required super.daysDelayed,
        required super.isPaid,
    });

    factory ColAnnuitiesDetailModel.fromJson(Map<String, dynamic> json) => ColAnnuitiesDetailModel(
        idLoanCreditAnnuity: json["idLoanCreditAnnuity"],
        annuityNumber: json["annuityNumber"],
        annuityEndDate: DateTime.parse(json["annuityEndDate"]),
        annuityBalance: json["annuityBalance"]?.toDouble(),
        daysDelayed: json["daysDelayed"],
        isPaid: json["isPaid"],
    );

}
