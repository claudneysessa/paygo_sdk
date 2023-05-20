import 'package:logger/logger.dart';

import '../../interfaces/requisicao_confirmacao_interface.dart';
import '../../types/operation.dart';
import '../../types/transaction_status.dart';

class TransacaoRequisicaoConfirmacao extends IRequisicaoConfirmacao {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  late Operation _operation;
  late String _transactionId;
  late TransactionStatus _transactionStatus;

  TransacaoRequisicaoConfirmacao({
    required confirmationTransactionId,
    required status,
  }) {
    _operation = Operation.confirmacao;
    _transactionStatus = status;

    _transactionId = confirmationTransactionId;
  }

  @override
  String obterUri() {
    String urlVenda = uriScheme;

    loggerNoStack.i("Transaction Id: $_transactionId");

    urlVenda += "confirmationTransactionId=$_transactionId";
    urlVenda += "&transactionStatus=${_transactionStatus.requisicaoTransactionStatusString}";

    loggerNoStack.i("Transaction Uri: $urlVenda");

    return urlVenda;
  }

  @override
  Operation get obterOperacao => _operation;

  @override
  String get obterIdTransacao => _transactionId;

  @override
  String get uriScheme => "app://confirmation/confirmation?";
}
