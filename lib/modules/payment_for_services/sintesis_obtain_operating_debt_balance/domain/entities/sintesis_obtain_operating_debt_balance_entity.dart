class SintesisObtainOperatingDebtBalanceResponseEntity {
  final SintesisObtainOperatingDebtBalanceEntity data;
  final int state;
  final String message;

  SintesisObtainOperatingDebtBalanceResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class SintesisObtainOperatingDebtBalanceEntity {
  final List<String> searchParameters;
  final int operationNumber;
  final int operativeDate;
  final List<ColAccountEntity> colAccounts;

  SintesisObtainOperatingDebtBalanceEntity({
    required this.searchParameters,
    required this.operationNumber,
    required this.operativeDate,
    required this.colAccounts,
  });
}

class ColAccountEntity {
  final String accountCode;
  final String customerName;
  final String accountDescription;
  final int serviceCode;
  final String serviceDescription;
  final int codeCurrency;
  final String invoicingNit;
  final String invoicingCustomerName;
  final String invoicingNitComplement;
  final String invoicingEmail;
  final String invoicingDocType;
  final String invoicingPhone;
  final bool withInvoice;
  final String collectionType;
  final String carDepartment;
  final dynamic carType;
  final dynamic carUseType;
  final String internalUserToken;
  final String userMf;
  final String additionalInfo;
  final int idcChangeInvoicingData;
  final bool itHasRequirement;
  final List<ColAccountItemDetailEntity> colAccountItemDetail;

  ColAccountEntity({
    required this.accountCode,
    required this.customerName,
    required this.accountDescription,
    required this.serviceCode,
    required this.serviceDescription,
    required this.codeCurrency,
    required this.invoicingNit,
    required this.invoicingCustomerName,
    required this.invoicingNitComplement,
    required this.invoicingEmail,
    required this.invoicingDocType,
    required this.invoicingPhone,
    required this.withInvoice,
    required this.collectionType,
    required this.carDepartment,
    required this.carType,
    required this.carUseType,
    required this.internalUserToken,
    required this.userMf,
    required this.additionalInfo,
    required this.idcChangeInvoicingData,
    required this.itHasRequirement,
    required this.colAccountItemDetail,
  });
}

class ColAccountItemDetailEntity {
  final bool selectedItem;
  final String itemNumberCode;
  final String itemDescription;
  final String itemCurrency;
  final String itemDependency;
  final String paymentMethodType;
  final double itemAmount;
  final bool allowMultipleSelection;
  final bool isMandatory;
  final bool needLoadSubDetails;
  final bool allowMoreOnePay;
  final bool customerDefineAmount;
  final bool withInvoice;
  final String batchDosage;
  final String rentNumber;
  final int amountMin;
  final dynamic amountMax;
  final int itemPeriod;
  final DateTime detailDate;

  ColAccountItemDetailEntity({
    required this.selectedItem,
    required this.itemNumberCode,
    required this.itemDescription,
    required this.itemCurrency,
    required this.itemDependency,
    required this.paymentMethodType,
    required this.itemAmount,
    required this.allowMultipleSelection,
    required this.isMandatory,
    required this.needLoadSubDetails,
    required this.allowMoreOnePay,
    required this.customerDefineAmount,
    required this.withInvoice,
    required this.batchDosage,
    required this.rentNumber,
    required this.amountMin,
    required this.amountMax,
    required this.itemPeriod,
    required this.detailDate,
  });
}
