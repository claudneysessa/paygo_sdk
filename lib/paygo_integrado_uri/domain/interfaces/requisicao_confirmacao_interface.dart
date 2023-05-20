import 'package:paygo_sdk/paygo_integrado_uri/domain/types/operation.dart';

abstract class IRequisicaoConfirmacao {
  String get uriScheme;
  Operation get obterOperacao;
  String get obterIdTransacao;
  String obterUri();
}
