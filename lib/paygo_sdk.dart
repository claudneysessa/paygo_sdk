library paygo_sdk;

import 'package:paygo_sdk/paygo_integrado_uri/infrastructure/repositories/paygo_integrado_repository.dart';

export './paygo_integrado_uri/paygo_integrado.dart';

class PayGOSdk {
  late PayGOIntegradoRepository _repository;

  PayGOSdk() {
    _repository = PayGOIntegradoRepository();
  }

  get integrado => _repository;
}
