// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransacaoRequisicaoResposta {
  late String uri;
  late String operation;
  late String transactionResult;
  late String amount;
  late String currencyCode;
  late String requiresConfirmation;
  late String confirmationTransactionId;
  late String cashbackAmount;
  late String discountAmount;
  late String balanceVoucher;
  late String dueAmount;
  late String fiscalDocument;
  late String transactionNsu;
  late String terminalNsu;
  late String authorizationCode;
  late String transactionId;
  late String merchantId;
  late String posId;
  late String merchantName;
  late String transactionDateTime;
  late String installments;
  late String predatedDate;
  late String finType;
  late String providerName;
  late String cardType;
  late String cardEntryMode;
  late String maskedPan;
  late String defaultMaskedPan;
  late String cardholderVerificationMode;
  late String cardName;
  late String defaultCardName;
  late String cardholderName;
  late String aid;
  late String resultMessage;
  late String authorizerResponse;
  late String printReceipts;
  late String fullReceipt;
  late String merchantReceipt;
  late String cardholderReceipt;
  late String shortReceipt;
  late String graphicReceiptExists;
  late String merchantGraphicReceipt;
  late String cardholderGraphicReceipt;
  late String originalTransactionAmount;
  late String originalTransactionDateTime;
  late String originalTransactionNsu;
  late String originalAuthorizationCode;
  late String originalTerminalNsu;
  late String pendingTransactionExists;
  late String authorizationMode;
  late String paymentMode;
  late String walletUserId;
  late String uniqueId;

  TransacaoRequisicaoResposta();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> retorno = {};

    retorno['operation'] = operation != '' ? operation : null;
    retorno['transactionResult'] = transactionResult != '' ? transactionResult : null;
    retorno['amount'] = amount != '' ? amount : null;
    retorno['currencyCode'] = currencyCode != '' ? currencyCode : null;
    retorno['requiresConfirmation'] = requiresConfirmation != '' ? requiresConfirmation : null;
    retorno['confirmationTransactionId'] = confirmationTransactionId != '' ? confirmationTransactionId : null;
    retorno['cashbackAmount'] = cashbackAmount != '' ? cashbackAmount : null;
    retorno['discountAmount'] = discountAmount != '' ? discountAmount : null;
    retorno['balanceVoucher'] = balanceVoucher != '' ? balanceVoucher : null;
    retorno['dueAmount'] = dueAmount != '' ? dueAmount : null;
    retorno['fiscalDocument'] = fiscalDocument != '' ? fiscalDocument : null;
    retorno['transactionNsu'] = transactionNsu != '' ? transactionNsu : null;
    retorno['terminalNsu'] = terminalNsu != '' ? terminalNsu : null;
    retorno['authorizationCode'] = authorizationCode != '' ? authorizationCode : null;
    retorno['transactionId'] = transactionId != '' ? transactionId : null;
    retorno['merchantId'] = merchantId != '' ? merchantId : null;
    retorno['posId'] = posId != '' ? posId : null;
    retorno['merchantName'] = merchantName != '' ? merchantName : null;
    retorno['transactionDateTime'] = transactionDateTime != '' ? transactionDateTime : null;
    retorno['installments'] = installments != '' ? installments : null;
    retorno['predatedDate'] = predatedDate != '' ? predatedDate : null;
    retorno['finType'] = finType != '' ? finType : null;
    retorno['providerName'] = providerName != '' ? providerName : null;
    retorno['cardType'] = cardType != '' ? cardType : null;
    retorno['cardEntryMode'] = cardEntryMode != '' ? cardEntryMode : null;
    retorno['maskedPan'] = maskedPan != '' ? maskedPan : null;
    retorno['defaultMaskedPan'] = defaultMaskedPan != '' ? defaultMaskedPan : null;
    retorno['cardholderVerificationMode'] = cardholderVerificationMode != '' ? cardholderVerificationMode : null;
    retorno['cardName'] = cardName != '' ? cardName : null;
    retorno['defaultCardName'] = defaultCardName != '' ? defaultCardName : null;
    retorno['cardholderName'] = cardholderName != '' ? cardholderName : null;
    retorno['aid'] = aid != '' ? aid : null;
    retorno['resultMessage'] = resultMessage != '' ? resultMessage : null;
    retorno['authorizerResponse'] = authorizerResponse != '' ? authorizerResponse : null;
    retorno['printReceipts'] = printReceipts != '' ? printReceipts : null;
    retorno['fullReceipt'] = fullReceipt != '' ? fullReceipt : null;
    retorno['merchantReceipt'] = merchantReceipt != '' ? merchantReceipt : null;
    retorno['cardholderReceipt'] = cardholderReceipt != '' ? cardholderReceipt : null;
    retorno['shortReceipt'] = shortReceipt != '' ? shortReceipt : null;
    retorno['graphicReceiptExists'] = graphicReceiptExists != '' ? graphicReceiptExists : null;
    retorno['merchantGraphicReceipt'] = merchantGraphicReceipt != '' ? merchantGraphicReceipt : null;
    retorno['cardholderGraphicReceipt'] = cardholderGraphicReceipt != '' ? cardholderGraphicReceipt : null;
    retorno['originalTransactionAmount'] = originalTransactionAmount != '' ? originalTransactionAmount : null;
    retorno['originalTransactionDateTime'] = originalTransactionDateTime != '' ? originalTransactionDateTime : null;
    retorno['originalTransactionNsu'] = originalTransactionNsu != '' ? originalTransactionNsu : null;
    retorno['originalAuthorizationCode'] = originalAuthorizationCode != '' ? originalAuthorizationCode : null;
    retorno['originalTerminalNsu'] = originalTerminalNsu != '' ? originalTerminalNsu : null;
    retorno['pendingTransactionExists'] = pendingTransactionExists != '' ? pendingTransactionExists : null;
    retorno['authorizationMode'] = authorizationMode != '' ? authorizationMode : null;
    retorno['paymentMode'] = paymentMode != '' ? paymentMode : null;
    retorno['walletUserId'] = walletUserId != '' ? walletUserId : null;
    retorno['uniqueId'] = uniqueId != '' ? uniqueId : null;

    retorno.removeWhere((key, value) => value == null);

    return retorno;
  }

  factory TransacaoRequisicaoResposta.fromUri(String uri) {
    var uriData = Uri.parse(uri);
    return TransacaoRequisicaoResposta()
      ..operation = uriData.queryParameters['operation'] ?? ''
      ..transactionResult = uriData.queryParameters['transactionResult'] ?? ''
      ..amount = uriData.queryParameters['amount'] ?? ''
      ..currencyCode = uriData.queryParameters['currencyCode'] ?? ''
      ..requiresConfirmation = uriData.queryParameters['requiresConfirmation'] ?? ''
      ..confirmationTransactionId = uriData.queryParameters['confirmationTransactionId'] ?? ''
      ..cashbackAmount = uriData.queryParameters['cashbackAmount'] ?? ''
      ..discountAmount = uriData.queryParameters['discountAmount'] ?? ''
      ..balanceVoucher = uriData.queryParameters['balanceVoucher'] ?? ''
      ..dueAmount = uriData.queryParameters['dueAmount'] ?? ''
      ..fiscalDocument = uriData.queryParameters['fiscalDocument'] ?? ''
      ..transactionNsu = uriData.queryParameters['transactionNsu'] ?? ''
      ..terminalNsu = uriData.queryParameters['terminalNsu'] ?? ''
      ..authorizationCode = uriData.queryParameters['authorizationCode'] ?? ''
      ..transactionId = uriData.queryParameters['transactionId'] ?? ''
      ..merchantId = uriData.queryParameters['merchantId'] ?? ''
      ..posId = uriData.queryParameters['posId'] ?? ''
      ..merchantName = uriData.queryParameters['merchantName'] ?? ''
      ..transactionDateTime = uriData.queryParameters['transactionDateTime'] ?? ''
      ..installments = uriData.queryParameters['installments'] ?? ''
      ..predatedDate = uriData.queryParameters['predatedDate'] ?? ''
      ..finType = uriData.queryParameters['finType'] ?? ''
      ..providerName = uriData.queryParameters['providerName'] ?? ''
      ..cardType = uriData.queryParameters['cardType'] ?? ''
      ..cardEntryMode = uriData.queryParameters['cardEntryMode'] ?? ''
      ..maskedPan = uriData.queryParameters['maskedPan'] ?? ''
      ..defaultMaskedPan = uriData.queryParameters['defaultMaskedPan'] ?? ''
      ..cardholderVerificationMode = uriData.queryParameters['cardholderVerificationMode'] ?? ''
      ..cardName = uriData.queryParameters['cardName'] ?? ''
      ..defaultCardName = uriData.queryParameters['defaultCardName'] ?? ''
      ..cardholderName = uriData.queryParameters['cardholderName'] ?? ''
      ..aid = uriData.queryParameters['aid'] ?? ''
      ..resultMessage = uriData.queryParameters['resultMessage'] ?? ''
      ..authorizerResponse = uriData.queryParameters['authorizerResponse'] ?? ''
      ..printReceipts = uriData.queryParameters['printReceipts'] ?? ''
      ..fullReceipt = uriData.queryParameters['fullReceipt'] ?? ''
      ..merchantReceipt = uriData.queryParameters['merchantReceipt'] ?? ''
      ..cardholderReceipt = uriData.queryParameters['cardholderReceipt'] ?? ''
      ..shortReceipt = uriData.queryParameters['shortReceipt'] ?? ''
      ..graphicReceiptExists = uriData.queryParameters['graphicReceiptExists'] ?? ''
      ..merchantGraphicReceipt = uriData.queryParameters['merchantGraphicReceipt'] ?? ''
      ..cardholderGraphicReceipt = uriData.queryParameters['cardholderGraphicReceipt'] ?? ''
      ..originalTransactionAmount = uriData.queryParameters['originalTransactionAmount'] ?? ''
      ..originalTransactionDateTime = uriData.queryParameters['originalTransactionDateTime'] ?? ''
      ..originalTransactionNsu = uriData.queryParameters['originalTransactionNsu'] ?? ''
      ..originalAuthorizationCode = uriData.queryParameters['originalAuthorizationCode'] ?? ''
      ..originalTerminalNsu = uriData.queryParameters['originalTerminalNsu'] ?? ''
      ..pendingTransactionExists = uriData.queryParameters['pendingTransactionExists'] ?? ''
      ..authorizationMode = uriData.queryParameters['authorizationMode'] ?? ''
      ..paymentMode = uriData.queryParameters['paymentMode'] ?? ''
      ..walletUserId = uriData.queryParameters['walletUserId'] ?? ''
      ..uniqueId = uriData.queryParameters['uniqueId'] ?? '';
  }

  factory TransacaoRequisicaoResposta.fromMap(Map<String, dynamic> map) {
    return TransacaoRequisicaoResposta()
      ..operation = map['operation'] ?? ''
      ..transactionResult = map['transactionResult'] ?? ''
      ..amount = map['amount'] ?? ''
      ..currencyCode = map['currencyCode'] ?? ''
      ..requiresConfirmation = map['requiresConfirmation'] ?? ''
      ..confirmationTransactionId = map['confirmationTransactionId'] ?? ''
      ..cashbackAmount = map['cashbackAmount'] ?? ''
      ..discountAmount = map['discountAmount'] ?? ''
      ..balanceVoucher = map['balanceVoucher'] ?? ''
      ..dueAmount = map['dueAmount'] ?? ''
      ..fiscalDocument = map['fiscalDocument'] ?? ''
      ..transactionNsu = map['transactionNsu'] ?? ''
      ..terminalNsu = map['terminalNsu'] ?? ''
      ..authorizationCode = map['authorizationCode'] ?? ''
      ..transactionId = map['transactionId'] ?? ''
      ..merchantId = map['merchantId'] ?? ''
      ..posId = map['posId'] ?? ''
      ..merchantName = map['merchantName'] ?? ''
      ..transactionDateTime = map['transactionDateTime'] ?? ''
      ..installments = map['installments'] ?? ''
      ..predatedDate = map['predatedDate'] ?? ''
      ..finType = map['finType'] ?? ''
      ..providerName = map['providerName'] ?? ''
      ..cardType = map['cardType'] ?? ''
      ..cardEntryMode = map['cardEntryMode'] ?? ''
      ..maskedPan = map['maskedPan'] ?? ''
      ..defaultMaskedPan = map['defaultMaskedPan'] ?? ''
      ..cardholderVerificationMode = map['cardholderVerificationMode'] ?? ''
      ..cardName = map['cardName'] ?? ''
      ..defaultCardName = map['defaultCardName'] ?? ''
      ..cardholderName = map['cardholderName'] ?? ''
      ..aid = map['aid'] ?? ''
      ..resultMessage = map['resultMessage'] ?? ''
      ..authorizerResponse = map['authorizerResponse'] ?? ''
      ..printReceipts = map['printReceipts'] ?? ''
      ..fullReceipt = map['fullReceipt'] ?? ''
      ..merchantReceipt = map['merchantReceipt'] ?? ''
      ..cardholderReceipt = map['cardholderReceipt'] ?? ''
      ..shortReceipt = map['shortReceipt'] ?? ''
      ..graphicReceiptExists = map['graphicReceiptExists'] ?? ''
      ..merchantGraphicReceipt = map['merchantGraphicReceipt'] ?? ''
      ..cardholderGraphicReceipt = map['cardholderGraphicReceipt'] ?? ''
      ..originalTransactionAmount = map['originalTransactionAmount'] ?? ''
      ..originalTransactionDateTime = map['originalTransactionDateTime'] ?? ''
      ..originalTransactionNsu = map['originalTransactionNsu'] ?? ''
      ..originalAuthorizationCode = map['originalAuthorizationCode'] ?? ''
      ..originalTerminalNsu = map['originalTerminalNsu'] ?? ''
      ..pendingTransactionExists = map['pendingTransactionExists'] ?? ''
      ..authorizationMode = map['authorizationMode'] ?? ''
      ..paymentMode = map['paymentMode'] ?? ''
      ..walletUserId = map['walletUserId'] ?? ''
      ..uniqueId = map['uniqueId'] ?? '';
  }

  String toJson() => json.encode(toMap());

  factory TransacaoRequisicaoResposta.fromJson(String source) =>
      TransacaoRequisicaoResposta.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant TransacaoRequisicaoResposta other) {
    if (identical(this, other)) return true;

    return other.operation == operation &&
        other.transactionResult == transactionResult &&
        other.amount == amount &&
        other.currencyCode == currencyCode &&
        other.requiresConfirmation == requiresConfirmation &&
        other.confirmationTransactionId == confirmationTransactionId &&
        other.cashbackAmount == cashbackAmount &&
        other.discountAmount == discountAmount &&
        other.balanceVoucher == balanceVoucher &&
        other.dueAmount == dueAmount &&
        other.fiscalDocument == fiscalDocument &&
        other.transactionNsu == transactionNsu &&
        other.terminalNsu == terminalNsu &&
        other.authorizationCode == authorizationCode &&
        other.transactionId == transactionId &&
        other.merchantId == merchantId &&
        other.posId == posId &&
        other.merchantName == merchantName &&
        other.transactionDateTime == transactionDateTime &&
        other.installments == installments &&
        other.predatedDate == predatedDate &&
        other.finType == finType &&
        other.providerName == providerName &&
        other.cardType == cardType &&
        other.cardEntryMode == cardEntryMode &&
        other.maskedPan == maskedPan &&
        other.defaultMaskedPan == defaultMaskedPan &&
        other.cardholderVerificationMode == cardholderVerificationMode &&
        other.cardName == cardName &&
        other.defaultCardName == defaultCardName &&
        other.cardholderName == cardholderName &&
        other.aid == aid &&
        other.resultMessage == resultMessage &&
        other.authorizerResponse == authorizerResponse &&
        other.printReceipts == printReceipts &&
        other.fullReceipt == fullReceipt &&
        other.merchantReceipt == merchantReceipt &&
        other.cardholderReceipt == cardholderReceipt &&
        other.shortReceipt == shortReceipt &&
        other.graphicReceiptExists == graphicReceiptExists &&
        other.merchantGraphicReceipt == merchantGraphicReceipt &&
        other.cardholderGraphicReceipt == cardholderGraphicReceipt &&
        other.originalTransactionAmount == originalTransactionAmount &&
        other.originalTransactionDateTime == originalTransactionDateTime &&
        other.originalTransactionNsu == originalTransactionNsu &&
        other.originalAuthorizationCode == originalAuthorizationCode &&
        other.originalTerminalNsu == originalTerminalNsu &&
        other.pendingTransactionExists == pendingTransactionExists &&
        other.authorizationMode == authorizationMode &&
        other.paymentMode == paymentMode &&
        other.walletUserId == walletUserId &&
        other.uniqueId == uniqueId;
  }

  @override
  int get hashCode {
    return operation.hashCode ^
        transactionResult.hashCode ^
        amount.hashCode ^
        currencyCode.hashCode ^
        requiresConfirmation.hashCode ^
        confirmationTransactionId.hashCode ^
        cashbackAmount.hashCode ^
        discountAmount.hashCode ^
        balanceVoucher.hashCode ^
        dueAmount.hashCode ^
        fiscalDocument.hashCode ^
        transactionNsu.hashCode ^
        terminalNsu.hashCode ^
        authorizationCode.hashCode ^
        transactionId.hashCode ^
        merchantId.hashCode ^
        posId.hashCode ^
        merchantName.hashCode ^
        transactionDateTime.hashCode ^
        installments.hashCode ^
        predatedDate.hashCode ^
        finType.hashCode ^
        providerName.hashCode ^
        cardType.hashCode ^
        cardEntryMode.hashCode ^
        maskedPan.hashCode ^
        defaultMaskedPan.hashCode ^
        cardholderVerificationMode.hashCode ^
        cardName.hashCode ^
        defaultCardName.hashCode ^
        cardholderName.hashCode ^
        aid.hashCode ^
        resultMessage.hashCode ^
        authorizerResponse.hashCode ^
        printReceipts.hashCode ^
        fullReceipt.hashCode ^
        merchantReceipt.hashCode ^
        cardholderReceipt.hashCode ^
        shortReceipt.hashCode ^
        graphicReceiptExists.hashCode ^
        merchantGraphicReceipt.hashCode ^
        cardholderGraphicReceipt.hashCode ^
        originalTransactionAmount.hashCode ^
        originalTransactionDateTime.hashCode ^
        originalTransactionNsu.hashCode ^
        originalAuthorizationCode.hashCode ^
        originalTerminalNsu.hashCode ^
        pendingTransactionExists.hashCode ^
        authorizationMode.hashCode ^
        paymentMode.hashCode ^
        walletUserId.hashCode ^
        uniqueId.hashCode;
  }
}
