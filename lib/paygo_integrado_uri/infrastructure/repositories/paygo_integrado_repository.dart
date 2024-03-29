import 'package:paygo_sdk/paygo_integrado_uri/domain/models/exception/paygo_sdk_exception.dart';
import 'package:paygo_sdk/paygo_integrado_uri/infrastructure/services/paygo_integrado_service.dart';

import '../../domain/interfaces/requisicao_confirmacao_interface.dart';
import '../../domain/interfaces/requisicao_interface.dart';
import '../../domain/interfaces/requisicao_pendencia_interface.dart';
import '../../domain/models/transacao/transacao_requisicao_administrativa.dart';
import '../../domain/models/transacao/transacao_requisicao_personalizacao.dart';
import '../../domain/models/transacao/transacao_requisicao_dados_automacao.dart';
import '../../domain/models/transacao/transacao_requisicao_venda.dart';
import '../../domain/types/intent_action.dart';

class PayGOIntegradoRepository {
  late PayGOIntegradoService _service;

  PayGOIntegradoRepository() {
    _service = PayGOIntegradoService();
  }

  Future<bool> verificarStatusDoChannel({
    String stringDeConfirmacao = 'Teste de retorno do Channel',
  }) async {
    try {
      bool retornoMetodo = await _service.verificarStatusDoChannel(
        stringDeConfirmacao: 'Teste de retorno do Channel',
      );

      return retornoMetodo;
    } on PayGOSdkException catch (e) {
      throw PayGOSdkException(
        code: 2,
        platformInfo: e.platformInfo,
        message: e.message,
        object: e.object,
      );
    }
  }

  Future<bool> administrativo({
    TransacaoRequisicaoDadosAutomacao? dadosAutomacao,
  }) async {
    try {
      bool retornoMetodo = await _service.iniciarTransacaoUri(
        IntentAction.payment,
        TransacaoRequisicaoAdministrativa(),
        dadosAutomacao ??
            TransacaoRequisicaoDadosAutomacao(
              'PAYGO',
              '1.0.0.0',
              'Automação',
              allowCashback: true,
              allowDifferentReceipts: true,
              allowDiscount: true,
              allowDueAmount: true,
              allowShortReceipt: false,
            ),
        TransacaoRequisicaoPersonalizacao(),
      );

      return retornoMetodo;
    } on PayGOSdkException catch (e) {
      throw PayGOSdkException(
        code: 2,
        platformInfo: e.platformInfo,
        message: e.message,
        object: e.object,
      );
    }
  }

  Future<void> venda({
    required TransacaoRequisicaoVenda requisicaoVenda,
    TransacaoRequisicaoDadosAutomacao? dadosAutomacao,
  }) async {
    try {
      await _service.iniciarTransacaoUri(
        IntentAction.payment,
        requisicaoVenda,
        dadosAutomacao ??
            TransacaoRequisicaoDadosAutomacao(
              'PAYGO',
              '1.0.0.0',
              'Automação',
              allowCashback: true,
              allowDifferentReceipts: true,
              allowDiscount: true,
              allowDueAmount: true,
              allowShortReceipt: false,
            ),
        TransacaoRequisicaoPersonalizacao(),
      );
    } on PayGOSdkException catch (e) {
      throw PayGOSdkException(
        code: 2,
        platformInfo: e.platformInfo,
        message: e.message,
        object: e.object,
      );
    }
  }

  Future<void> generico({
    required IntentAction intentAction,
    required IRequisicao requisicao,
    TransacaoRequisicaoDadosAutomacao? dadosAutomacao,
  }) async {
    try {
      await _service.iniciarTransacaoUri(
        intentAction,
        requisicao,
        dadosAutomacao ??
            TransacaoRequisicaoDadosAutomacao(
              'PAYGO',
              '1.0.0.0',
              'Automação',
              allowCashback: true,
              allowDifferentReceipts: true,
              allowDiscount: true,
              allowDueAmount: true,
              allowShortReceipt: false,
            ),
        TransacaoRequisicaoPersonalizacao(),
      );
    } on PayGOSdkException catch (e) {
      throw PayGOSdkException(
        code: 2,
        platformInfo: e.platformInfo,
        message: e.message,
        object: e.object,
      );
    }
  }

  Future<void> confirmarTransacao({
    required IntentAction intentAction,
    required IRequisicaoConfirmacao requisicao,
  }) async {
    try {
      await _service.confirmarTransacao(
        intentAction,
        requisicao,
      );
    } on PayGOSdkException catch (e) {
      throw PayGOSdkException(
        code: 2,
        platformInfo: e.platformInfo,
        message: e.message,
        object: e.object,
      );
    }
  }

  Future<void> resolucaoPendencia({
    required IntentAction intentAction,
    required String requisicaoPendencia,
    required IRequisicaoPendencia requisicaoConfirmacao,
  }) async {
    try {
      await _service.resolucaoPendencia(
        intentAction,
        requisicaoPendencia,
        requisicaoConfirmacao,
      );
    } on PayGOSdkException catch (e) {
      throw PayGOSdkException(
        code: 2,
        platformInfo: e.platformInfo,
        message: e.message,
        object: e.object,
      );
    }
  }
}
