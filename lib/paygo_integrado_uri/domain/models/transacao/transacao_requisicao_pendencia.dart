import 'package:logger/logger.dart';

import '../../interfaces/requisicao_pendencia_interface.dart';
import '../../types/operation.dart';
import '../../types/transaction_status.dart';

class TransacaoRequisicaoPendencia extends IRequisicaoPendencia {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  late Operation _operation;
  late TransactionStatus _transactionStatus;

  TransacaoRequisicaoPendencia({
    required status,
  }) {
    _operation = Operation.resolucaoPendencia;
    _transactionStatus = status;
  }

  @override
  String obterUri() {
    String urlVenda = uriScheme;

    urlVenda += "transactionStatus=${_transactionStatus.requisicaoTransactionStatusString}";

    loggerNoStack.i("Transaction Uri: $urlVenda");

    return urlVenda;
  }

  @override
  Operation get obterOperacao => _operation;

  @override
  String get uriScheme => "app://resolve/confirmation?";
}
