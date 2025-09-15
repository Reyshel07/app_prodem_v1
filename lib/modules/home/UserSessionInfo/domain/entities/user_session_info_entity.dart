class UserSessionInfoResponseEntity {
  final UserInfoResponseEnttity data;
  final int state;
  final String message;

  UserSessionInfoResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class UserInfoResponseEnttity {
  final String userId;
  final String userName;
  final String idPerson;
  final String idWebClient;
  final List<ListCodeResponseEntity> listCodeSavingsAccount;
  final List<ListCodeResponseEntity> listCodeLoanFlowCredit;
  final List<ListCodeResponseEntity> listCodeCreditLine;
  final List<dynamic> listElectronicWallet;
  final int currencyExchangeBuy;
  final int currencyExchangeSell;
  final bool isEmployee;
  final DateTime processDate;
  final dynamic personName;
  final dynamic idcQuestion;
  final dynamic cellPhoneNumber;
  final int maximumAmount;
  final int maximumElectronicWalletAmount;
  final dynamic email;
  final bool sendEmailNotification;
  final dynamic identityCardNumber;
  final dynamic estado;
  final bool isPersonNatural;
  final bool isCallCenter;
  final bool isEtv;
  final bool hasContractPending;
  final String contractMessage;
  final List<ListAdResponseEntity> listAds;
  final List<dynamic> listLipBank;
  final List<dynamic> listAchBank;
  final List<dynamic> listDobBank;
  final List<dynamic> listOriginFund;
  final List<dynamic> listCommand;

  UserInfoResponseEnttity({
    required this.userId,
    required this.userName,
    required this.idPerson,
    required this.idWebClient,
    required this.listCodeSavingsAccount,
    required this.listCodeLoanFlowCredit,
    required this.listCodeCreditLine,
    required this.listElectronicWallet,
    required this.currencyExchangeBuy,
    required this.currencyExchangeSell,
    required this.isEmployee,
    required this.processDate,
    required this.personName,
    required this.idcQuestion,
    required this.cellPhoneNumber,
    required this.maximumAmount,
    required this.maximumElectronicWalletAmount,
    required this.email,
    required this.sendEmailNotification,
    required this.identityCardNumber,
    required this.estado,
    required this.isPersonNatural,
    required this.isCallCenter,
    required this.isEtv,
    required this.hasContractPending,
    required this.contractMessage,
    required this.listAds,
    required this.listLipBank,
    required this.listAchBank,
    required this.listDobBank,
    required this.listOriginFund,
    required this.listCommand,
  });
}

class ListAdResponseEntity {
  final String imageUrl;
  final int typeToLink;
  final String linkToGo;
  final bool withAnimation;
  final int orderSequence;

  ListAdResponseEntity({
    required this.imageUrl,
    required this.typeToLink,
    required this.linkToGo,
    required this.withAnimation,
    required this.orderSequence,
  });
}

class ListCodeResponseEntity {
  final int idMoney;
  final String codMoney;
  final double idOperationEntity;
  final String operationCode;
  final double availableAmount;
  final int idOffice;
  final int specialBehavior;

  ListCodeResponseEntity({
    required this.idMoney,
    required this.codMoney,
    required this.idOperationEntity,
    required this.operationCode,
    required this.availableAmount,
    required this.idOffice,
    required this.specialBehavior,
  });
}
