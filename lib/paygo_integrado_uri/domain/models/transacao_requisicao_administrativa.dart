import 'dart:math' as math;

import 'package:logger/logger.dart';

import '../interfaces/requisicao_interface.dart';
import '../types/operation.dart';

class TransacaoRequisicaoAdministrativa extends IRequisicao {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  late String transactionId;

  TransacaoRequisicaoAdministrativa() {
    transactionId = math.Random().nextInt(999999999).toString();
  }

  @override
  String obterUri() {
    String urlAdm = uriScheme;

    loggerNoStack.i("Transaction Id: $transactionId");

    urlAdm += "transactionId=$transactionId";
    urlAdm += "&operation=${obterOperacao.requisicaoOperationString}";

    loggerNoStack.i("Transaction Uri: $urlAdm");

    return urlAdm;
  }

  @override
  Operation get obterOperacao => Operation.administrativa;

  @override
  String get obterIdTransacao => transactionId;

  @override
  String get uriScheme => "app://payment/input?";
}
