import 'package:paygo_sdk/paygo_integrado_uri/domain/types/operation.dart';

abstract class IRequisicao {
  String get uriScheme;
  Operation get obterOperacao;
  String get obterIdTransacao;
  String obterUri();
}
