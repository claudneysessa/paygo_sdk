# PayGO SDK

Este package tem como finalidade prover uma interface de abstração para integração com o PayGO Intergrado via URI.

## Instalação

Para instalar o package, adicione o seguinte código no seu arquivo pubspec.yaml:

```yaml

dependencies:
  paygo_sdk: ^0.0.1

```

Observação : se você estiver usando o canal Flutter `master`, se encontrar problemas de compilação ou quiser experimentar uma versão melhor e mais recente, utilize a versão mais atual apontando para a `master` e não uma versão de lançamento específica. Para fazer isso, use a seguinte configuração no seu pubspec.yaml:

```yaml

dependencies:
  paygo_sdk:
    git:
      url: #Utilize a URL do repositorio do github

```

## Uso

Para utilizar o package, basta importar o mesmo no seu arquivo dart:

```dart

// Importe o package
import 'package:paygo_sdk/paygo_sdk.dart';

// Iniciando o SDK
PayGOSdk repository = PayGOSdk();

// Chamando o método de integração para abrir o menu administrativo
await repository.integrado.administrativo();

```

## Exemplos

### Solicitar abertura do menu administrativo

```dart

  Future<void> homeAdministrativoclick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.administrativo();
  }

```

### Solicitar abertura do mmenu de configuração

```dart

  Future<void> homeConfiguracaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.configuracao,
      ),
    );
  }

```

### Solicitar abertura do menu de manutenção

```dart

  Future<void> homeManutencaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.manutencao,
      ),
    );
  }

```

### Solicitar abertura do menu de instalação

```dart

  Future<void> homeInstalacaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.instalacao,
      ),
    );
  }

```

### Solicitar dados da versão da integração

```dart

  Future<void> homeVersaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.versao,
      ),
    );
  }

```

### Iniciar teste de comunicação

```dart

  Future<void> homeTesteComunicacaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.testeComunicacao,
      ),
    );
  }

```

### Exibir código do PDC

```dart

  Future<void> homeExibirPdcClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.exibePdc,
      ),
    );
  }

```

### Iniciar uma venda

Este exemplo mostra como iniciar uma venda com o PayGO Integrado.

No caso abaixo, estamos solicitando uma venda de R$ 100,99 com o cartão de débito, a vista, utilizando o provedor DEMO, que é um provedor de teste.

Exte exemplo pula as seleções do provedor, tipo de cartão e tipo de venda, mas é possível deixar o usuário escolher essas opções.

```dart

  Future<void> homeVendaClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.venda(
      TransacaoRequisicaoVenda(
        amount: 100.99,
        currencyCode: CurrencyCode.iso4217Real,
      )
        ..provider = "DEMO"
        ..cardType = CardType.cartaoDebito
        ..finType = FinType.aVista,
    );
  }

```

## Créditos

Este SDK foi desenvolvido por [Claudney Sarti Sessa](https://github.com/claudneysessa) atendendo as especificações da API de integração do [PayGO Integrado via URI](https://github.com/PGPagamentos/mobile-integracao-uri), fornecido pela [PayGO](https://paygo.com.br/) empresa que oferece produtos para captura de pagamentos físicos, online a fim de facilitar integração com os terminais de pagamento utilizando Dart/Flutter.
