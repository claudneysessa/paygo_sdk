import 'dart:math' as math;

import 'package:logger/logger.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/card_type.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/fin_type.dart';

import '../interfaces/requisicao_interface.dart';
import '../types/currency_code.dart';
import '../types/operation.dart';
import '../types/payment_mode.dart';

class TransacaoRequisicaoVenda extends IRequisicao {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  late Operation _operation;
  late String transactionId;

  double amount;
  CurrencyCode currencyCode;

  double? boardingTax;
  double? serviceTax;
  String? provider;
  CardType? cardType;
  FinType? finType;
  PaymentMode? paymentMode;
  double? installments;
  String? predatedDate;
  String? fiscalDocument;
  String? taxId;
  String? billNumber;
  String? phoneNumber;
  String? posId;
  String? originalAuthorizationCode;
  String? originalTransactionNsu;
  String? originalTransactionDateTime;
  Map<String, dynamic>? additionalPosData1;
  Map<String, dynamic>? additionalPosData2;
  Map<String, dynamic>? additionalPosData3;
  Map<String, dynamic>? additionalPosData4;

  TransacaoRequisicaoVenda({
    required this.amount,
    required this.currencyCode,
  }) {
    _operation = Operation.venda;

    transactionId = math.Random().nextInt(999999999).toString();

    additionalPosData1 = {
      "app": "PayGO Flutter",
      "version": "1.0.0.0",
    };

    additionalPosData2 = {
      "operation": obterOperacao.requisicaoOperationString,
      "transactionId": transactionId,
      "amount": (amount * 100).toInt().toString(),
    };
  }

  @override
  String obterUri() {
    String urlVenda = uriScheme;

    loggerNoStack.i("Transaction Id: $transactionId");

    urlVenda += "operation=${obterOperacao.requisicaoOperationString}";
    urlVenda += "&transactionId=$obterIdTransacao";
    urlVenda += "&amount=${(amount * 100).toInt().toString()}";
    urlVenda += "&currencyCode=${currencyCode.currencyCodeString}";

    if (boardingTax != null) {
      urlVenda += "&boardingTax=${(boardingTax! * 100).toInt().toString()}";
    }

    if (serviceTax != null) {
      urlVenda += "&serviceTax=${(serviceTax! * 100).toInt().toString()}";
    }

    if (provider != null) {
      urlVenda += "&provider=$provider";
    }

    if (cardType != null) {
      urlVenda += "&cardType=${cardType!.cardTypeString}";
    }

    if (finType != null) {
      urlVenda += "&finType=${finType!.finTypeString}";
    }

    if (paymentMode != null) {
      urlVenda += "&paymentMode=${paymentMode!.paymentModeString}";
    }

    if (installments != null) {
      urlVenda += "&installments=${installments!.toInt().toString()}";
    }

    if (predatedDate != null) {
      urlVenda += "&predatedDate=$predatedDate";
    }

    if (fiscalDocument != null) {
      urlVenda += "&fiscalDocument=$fiscalDocument";
    }

    if (taxId != null) {
      urlVenda += "&taxId=$taxId";
    }

    if (billNumber != null) {
      urlVenda += "&billNumber=$billNumber";
    }

    if (phoneNumber != null) {
      urlVenda += "&phoneNumber=$phoneNumber";
    }

    if (posId != null) {
      urlVenda += "&posId=$posId";
    }

    if (originalAuthorizationCode != null) {
      urlVenda += "&originalAuthorizationCode=$originalAuthorizationCode";
    }

    if (originalTransactionNsu != null) {
      urlVenda += "&originalTransactionNsu=$originalTransactionNsu";
    }

    if (originalTransactionDateTime != null) {
      urlVenda += "&originalTransactionDateTime=$originalTransactionDateTime";
    }

    if (additionalPosData1 != null) {
      urlVenda += "&additionalPosData1=$additionalPosData1";
    }

    if (additionalPosData2 != null) {
      urlVenda += "&additionalPosData2=$additionalPosData2";
    }

    if (additionalPosData3 != null) {
      urlVenda += "&additionalPosData3=$additionalPosData3";
    }

    if (additionalPosData4 != null) {
      urlVenda += "&additionalPosData4=$additionalPosData4";
    }

    loggerNoStack.i("Transaction Uri: $urlVenda");

    return urlVenda;
  }

  @override
  Operation get obterOperacao => _operation;

  @override
  String get obterIdTransacao => transactionId;

  @override
  String get uriScheme => "app://payment/input?";
}
