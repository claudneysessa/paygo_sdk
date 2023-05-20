import 'package:paygo_sdk/paygo_integrado_uri/domain/types/operation.dart';

abstract class IRequisicaoPendencia {
  String get uriScheme;
  Operation get obterOperacao;
  String obterUri();
}
