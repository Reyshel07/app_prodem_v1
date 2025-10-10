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
  final List<ListCodeCreditLineElementEntity> listCodeSavingsAccount;
  final List<ListCodeCreditLineElementEntity> listCodeLoanFlowCredit;
  final List<ListCodeCreditLineElementEntity> listCodeCreditLine;
  final List<ListCodeCreditLineElementEntity> listFixedTermDeposit;
  final List<dynamic> listElectronicWallet;
  final int currencyExchangeBuy;
  final int currencyExchangeSell;
  final bool isEmployee;
  final DateTime processDate;
  final dynamic personName;
  final String idcQuestion;
  final dynamic cellPhoneNumber;
  final int maximumAmount;
  final double maximumElectronicWalletAmount;
  final dynamic email;
  final bool sendEmailNotification;
  final dynamic identityCardNumber;
  final dynamic estado;
  final bool isPersonNatural;
  final bool isCallCenter;
  final bool isEtv;
  final bool hasContractPending;
  final String contractMessage;
  final List<ListAdEntity> listAds;
  final List<ListAchBankElementEntity> listLipBank;
  final List<ListAchBankElementEntity> listAchBank;
  final List<ListAchBankElementEntity> listDobBank;
  final List<ListAchBankElementEntity> listOriginFund;
  final List<dynamic> listCommand;
  final List<int> listServiceAvailable;

  UserInfoResponseEnttity({
    required this.userId,
    required this.userName,
    required this.idPerson,
    required this.idWebClient,
    required this.listCodeSavingsAccount,
    required this.listCodeLoanFlowCredit,
    required this.listCodeCreditLine,
    required this.listFixedTermDeposit,
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
    required this.listServiceAvailable,
  });
}

class ListAchBankElementEntity {
  final int idClasificador;
  final String nombre;
  final String codigo;

  ListAchBankElementEntity({
    required this.idClasificador,
    required this.nombre,
    required this.codigo,
  });
}

class ListAdEntity {
  final String imageUrl;
  final int typeToLink;
  final String linkToGo;
  final bool withAnimation;
  final int orderSequence;

  ListAdEntity({
    required this.imageUrl,
    required this.typeToLink,
    required this.linkToGo,
    required this.withAnimation,
    required this.orderSequence,
  });
}

class ListCodeCreditLineElementEntity {
  final int idMoney;
  final String codMoney;
  final double idOperationEntity;
  final String operationCode;
  final double availableAmount;
  final int idOffice;
  final int specialBehavior;
  final String stateOperation;
  final String balance;

  ListCodeCreditLineElementEntity({
    required this.idMoney,
    required this.codMoney,
    required this.idOperationEntity,
    required this.operationCode,
    required this.availableAmount,
    required this.idOffice,
    required this.specialBehavior,
    required this.stateOperation,
    required this.balance,
  });
}
