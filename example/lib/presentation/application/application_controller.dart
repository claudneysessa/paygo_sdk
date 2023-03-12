import 'dart:async';
import 'package:receive_intent/receive_intent.dart' as receive_intent;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:paygo_sdk/paygo_integrado_uri/paygo_integrado.dart';

class ApplicationController extends GetxController {
  late StreamSubscription _subscription;

  get subscription => _subscription;

  Future<void> _initReceiveIntent() async {
    _subscription = receive_intent.ReceiveIntent.receivedIntentStream.listen(
      (
        receive_intent.Intent? intent,
      ) {
        if (intent?.data != null) {
          final Uri uri = Uri.parse(intent?.data ?? '');

          final String decodedUri = Uri.decodeFull(
            uri.toString(),
          );

          TransacaoRequisicaoResposta? resposta;
          resposta = TransacaoRequisicaoResposta.fromUri(
            decodedUri,
          );

          Get.defaultDialog(
            titlePadding: const EdgeInsets.all(2),
            contentPadding: const EdgeInsets.all(20),
            title: "Resposta do PayGo Integrado",
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Operation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  resposta.operation,
                ),
                const Text(
                  'ID',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  resposta.transactionId,
                ),
                const Text(
                  'Mensagem',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  resposta.resultMessage,
                ),
              ],
            ),
          );

          loggerNoStack.i(
            "Intent Data: ${resposta.toMap()}",
          );
        }
      },
      onError: (err) {
        loggerNoStack.e("Erro ao receber Intent");
      },
    );
  }

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  @override
  void onInit() async {
    await _initReceiveIntent();
    super.onInit();
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
