import 'dart:convert';

import '../../domain/entities/entity.dart';

SintesisObtainOperatingDebtBalanceResponseModel
sintesisObtainOperatingDebtBalanceResponseFromJson(String str) =>
    SintesisObtainOperatingDebtBalanceResponseModel.fromJson(json.decode(str));

class SintesisObtainOperatingDebtBalanceResponseModel
    extends SintesisObtainOperatingDebtBalanceResponseEntity {
  SintesisObtainOperatingDebtBalanceResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory SintesisObtainOperatingDebtBalanceResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => SintesisObtainOperatingDebtBalanceResponseModel(
    data: SintesisObtainOperatingDebtBalanceModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class SintesisObtainOperatingDebtBalanceModel
    extends SintesisObtainOperatingDebtBalanceEntity {
  SintesisObtainOperatingDebtBalanceModel({
    required super.searchParameters,
    required super.operationNumber,
    required super.operativeDate,
    required super.colAccounts,
  });

  factory SintesisObtainOperatingDebtBalanceModel.fromJson(
    Map<String, dynamic> json,
  ) => SintesisObtainOperatingDebtBalanceModel(
    searchParameters: List<String>.from(json["searchParameters"].map((x) => x)),
    operationNumber: json["operationNumber"],
    operativeDate: json["operativeDate"],
    colAccounts: List<ColAccountModel>.from(
      json["colAccounts"].map((x) => ColAccountModel.fromJson(x)),
    ),
  );
}

class ColAccountModel extends ColAccountEntity {
  ColAccountModel({
    required super.accountCode,
    required super.customerName,
    required super.accountDescription,
    required super.serviceCode,
    required super.serviceDescription,
    required super.codeCurrency,
    required super.invoicingNit,
    required super.invoicingCustomerName,
    required super.invoicingNitComplement,
    required super.invoicingEmail,
    required super.invoicingDocType,
    required super.invoicingPhone,
    required super.withInvoice,
    required super.collectionType,
    required super.carDepartment,
    required super.carType,
    required super.carUseType,
    required super.internalUserToken,
    required super.userMf,
    required super.additionalInfo,
    required super.idcChangeInvoicingData,
    required super.itHasRequirement,
    required super.colAccountItemDetail,
  });

  factory ColAccountModel.fromJson(Map<String, dynamic> json) =>
      ColAccountModel(
        accountCode: json["accountCode"],
        customerName: json["customerName"],
        accountDescription: json["accountDescription"],
        serviceCode: json["serviceCode"],
        serviceDescription: json["serviceDescription"],
        codeCurrency: json["codeCurrency"],
        invoicingNit: json["invoicingNIT"],
        invoicingCustomerName: json["invoicingCustomerName"],
        invoicingNitComplement: json["invoicingNITComplement"],
        invoicingEmail: json["invoicingEmail"],
        invoicingDocType: json["invoicingDocType"],
        invoicingPhone: json["invoicingPhone"],
        withInvoice: json["withInvoice"],
        collectionType: json["collectionType"],
        carDepartment: json["carDepartment"],
        carType: json["carType"],
        carUseType: json["carUseType"],
        internalUserToken: json["internalUserToken"],
        userMf: json["userMF"],
        additionalInfo: json["additionalInfo"],
        idcChangeInvoicingData: json["idcChangeInvoicingData"],
        itHasRequirement: json["itHasRequirement"],
        colAccountItemDetail: List<ColAccountItemDetailModel>.from(
          json["colAccountItemDetail"].map(
            (x) => ColAccountItemDetailModel.fromJson(x),
          ),
        ),
      );
}

class ColAccountItemDetailModel extends ColAccountItemDetailEntity {
  ColAccountItemDetailModel({
    required super.selectedItem,
    required super.itemNumberCode,
    required super.itemDescription,
    required super.itemCurrency,
    required super.itemDependency,
    required super.paymentMethodType,
    required super.itemAmount,
    required super.allowMultipleSelection,
    required super.isMandatory,
    required super.needLoadSubDetails,
    required super.allowMoreOnePay,
    required super.customerDefineAmount,
    required super.withInvoice,
    required super.batchDosage,
    required super.rentNumber,
    required super.amountMin,
    required super.amountMax,
    required super.itemPeriod,
    required super.detailDate,
  });

  factory ColAccountItemDetailModel.fromJson(Map<String, dynamic> json) =>
      ColAccountItemDetailModel(
        selectedItem: json["selectedItem"],
        itemNumberCode: json["itemNumberCode"],
        itemDescription: json["itemDescription"],
        itemCurrency: json["itemCurrency"],
        itemDependency: json["itemDependency"],
        paymentMethodType: json["paymentMethodType"],
        itemAmount: json["itemAmount"].toDouble(),
        allowMultipleSelection: json["allowMultipleSelection"],
        isMandatory: json["isMandatory"],
        needLoadSubDetails: json["needLoadSubDetails"],
        allowMoreOnePay: json["allowMoreOnePay"],
        customerDefineAmount: json["customerDefineAmount"],
        withInvoice: json["withInvoice"],
        batchDosage: json["batchDosage"],
        rentNumber: json["rentNumber"],
        amountMin: json["amountMin"] ?? 0,
        amountMax: json["amountMax"],
        itemPeriod: json["itemPeriod"],
        detailDate: DateTime.parse(json["detailDate"]),
      );
}
