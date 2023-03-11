import 'package:flutter/services.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/models/exception/paygo_sdk_exception.dart';

import '../../domain/types/intent_action.dart';
import '../../domain/interfaces/requisicao_interface.dart';
import '../../domain/models/transacao/transacao_requisicao_dados_automacao.dart';
import '../../domain/models/transacao/transacao_requisicao_personalizacao.dart';

class PayGOIntegradoService {
  final _platform = const MethodChannel('br.com.claudneysessa/PayGOIntegrado');

  Future<bool> verificarStatusDoChannel({
    String stringDeConfirmacao = 'Teste de retorno do Channel',
  }) async {
    try {
      bool retornoMetodo = await _platform.invokeMethod(
        'verificarStatusDoChannel',
        {
          'args': {
            'mensagem': stringDeConfirmacao,
          }
        },
      );

      return retornoMetodo;
    } on PlatformException catch (e) {
      throw PayGOSdkException(
        code: 1,
        platformInfo: e.code,
        message: e.message,
        object: e,
      );
    }
  }

  Future<bool> iniciarTransacaoUri(
    IntentAction intentAction,
    IRequisicao requisicao,
    TransacaoRequisicaoDadosAutomacao dadosAutomacao,
    TransacaoRequisicaoPersonalizacao personalizacao,
  ) async {
    try {
      bool retornoMetodo = await _platform.invokeMethod(
        'iniciarTransacaoUri',
        {
          'args': {
            'intentAction': intentAction.intentActionString,
            'requisicao': requisicao.obterUri(),
            'dadosAutomacao': dadosAutomacao.obterUri(),
            'dadosPersonalizacao': personalizacao.obterUri(),
          }
        },
      );

      return retornoMetodo;
    } on PlatformException catch (e) {
      throw PayGOSdkException(
        code: 2,
        platformInfo: e.code,
        message: e.message,
        object: e,
      );
    }
  }
}
