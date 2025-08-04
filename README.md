# PayGO SDK

Este package tem como finalidade prover uma interface de abstração para integração com o PayGO Intergrado via URI efetuando a comunicação via intent com o aplicativo Paygo Integrado fornecido pela Setis.

Favor atentar a versão do aplicativo PayGO Integrado que está instalada no dispositivo, pois existem 2 versões do aplicativo, uma para dispositivos android padrão e uma versão específica para dispositivos da marca Gertec e estas cada uma possui a sua versão de produção e homologação.

## Project Flutter version

```bash
    flutter --version
    Flutter 3.7.5 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision c07f788888 (7 months ago) • 2023-02-22 17:52:33 -0600
    Engine • revision 0f359063c4
    Tools • Dart 2.19.2 • DevTools 2.20.1
```

## Instalação

Para instalar o package, adicione o seguinte código no seu arquivo pubspec.yaml:

```yaml

dependencies:
  paygo_sdk: ^0.0.8

```

Observação : se você estiver usando o canal Flutter `master`, se encontrar problemas de compilação ou quiser experimentar uma versão melhor e mais recente, utilize a versão mais atual apontando para a `master` e não uma versão de lançamento específica. Para fazer isso, use a seguinte configuração no seu pubspec.yaml:

```yaml

dependencies:
  paygo_sdk:
    git:
      url: #Utilize a URL do repositorio do github

```

## Configurações no AndroidManifest

Adicionar as seguintes instruções no arquivo AndroidManifest.xml:

```xml

  <!-- Permissões -->

  <uses-feature android:name="android.hardware.usb.host"/>

  <uses-permission android:name="android.permission.CAMERA"/>
  <uses-permission android:name="android.permission.FLASHLIGHT"/>
  <uses-permission android:name="android.permission.INTERNET" />
  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
  <uses-permission android:name="android.permission.READ_PHONE_STATE" />
  <uses-permission android:name="android.permission.BLUETOOTH" />
  <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
  <uses-permission android:name="android.permission.REORDER_TASKS" />

  <activity>

    .
    .
    .
    .
    .

    <!-- activity -->

    <intent-filter>
      <action android:name="br.com.setis.interfaceautomacao.SERVICO"/>
      <category android:name="android.intent.category.DEFAULT"/>
      <category android:name="android.intent.category.BROWSABLE" />
      <data android:scheme="app" android:host="payment" />
      <data android:scheme="app" android:host="resolve" />
    </intent-filter>

  </activity>

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

## Formato da URI

A URI segue o padrão RFC2396. A formatação das URIs trocadas entre a Automação Comercial e o aplicativo PayGo Integrado seguem o seguinte padrão:
```xml
<scheme>://<authority>/<path>?<query>
```
Sendo os componentes identificados a seguir:

| **Componente** | **Formato** |
| --- | --- |
| `<scheme>`    | Fixo: `"app"` |
| `<authority>` | Tipo de operação a ser efetuado, podendo ser:<br/><ul><li>`"payment"`, para operações do tipo Transação;</li><li>`"confirmation"`, para operações do tipo Confirmação;</li><li>`"resolve"`, para operações do tipo Resolução de pendência.</li></ul> |
| `<path>`      | Indica a origem da operação:<br/><ul><li>`"input"`: Indica que a operação está sendo requisitada pela Automação Comercial;</li><li>`"output"`: Indica que é uma resposta de operação requisitada pela automação.</li></ul> |
| `<query>`     | Contém os parâmetros da requisição/resposta, no formato `"<chave>=<valor>"`. Os parâmetros são separados pelo caractere `'&'`. |

## Parâmetros das Operações

Para os parâmetros de operação, sejam eles de requisição ou de resposta, serão adotados os seguintes padrões de identificação:

- Quanto à presença:
- M → Indica que o parâmetro é <ins>mandatório</ins>;
- MC → Indica que o parâmetro é <ins>mandatório condicional</ins>. As condições para seu uso estarão descritas juntas à especificação do parâmetro.
- O → Indica que o parâmetro é <ins>opcional</ins>.

- Quanto ao formato:
- N → Indica que o parâmetro é <ins>numérico</ins>;
- AN → Indica que o parâmetro é <ins>alfanumérico</ins> (são aceitos apenas caracteres na faixa ASCII, sem caracteres especiais);
- C → Indica que o parâmetro é uma <ins>constante</ins>. Seus possíveis valores estarão documentados junto ao campo;
- B → Indica que o parâmetro é <ins>booleano</ins> (assume valor "true" se verdadeiro e "false" se falso).

## Transação – Requisição

A tabela a seguir indica os parâmetros de requisição para uma transação:

| **Parâmetro** | **Presença** | **Formato** | **Descrição** |
| --- | :---: | :---: | --- |
| operation | M | C | Operação a ser realizada. Valores possíveis:<br/><ul><li>VENDA (operação de venda);</li><li>ADMINISTRATIVA (operação administrativa);</li><li>CANCELAMENTO (operação de cancelamento);</li><li>INSTALACAO (operação de instalação);</li><li>REIMPRESSAO (operação de reimpressão do último comprovante);</li><li>RELATORIO\_SINTETICO (obtém relatório sintético);</li><li>RELATORIO\_DETALHADO (obtém relatório detalhado);</li><li>RELATORIO\_RESUMIDO (obtém relatório resumido);</li><li>TESTE\_COMUNICACAO (realiza teste de comunicação);</li><li>EXIBE\_PDC (exibe o número do ponto de captura);</li><li>VERSAO (exibe a versão instalada);</li><li>CONFIGURACAO (operação de configuração);</li><li>MANUTENCAO (operação de manutenção).</li></ul> |
| transactionId | M | AN | Identificador gerado na automação comercial para a transação. |
| amount | MC | N | Valor da operação. Mandatório se a operação for do tipo VENDA ou CANCELAMENTO. |
| currencyCode | MC | N | Código da moeda, de acordo com ISO4217. Mandatório se operação possuir o parâmetro &quot;amount&quot;. |
| boardingTax | O | N | Taxa de embarque. |
| serviceTax | O | N | Taxa de serviço. |
| provider | O | AN | Nome do provedor utilizado na transação. |
| cardType | O | C | Tipo de cartão. Valores possíveis:<br/><ul><li>CARTAO\_DESCONHECIDO;</li><li>CARTAO\_CREDITO;</li><li>CARTAO\_DEBITO;</li><li>CARTAO\_VOUCHER;</li><li>CARTAO\_PRIVATELABEL;</li><li>CARTAO\_FROTA.</li></ul> |
| finType | O | C | Tipo de financiamento. Valores possíveis:<br/><ul><li>FINANCIAMENTO\_NAO\_DEFINIDO;</li><li>A\_VISTA;</li><li>PARCELADO\_EMISSOR;</li><li>PARCELADO\_ESTABELECIMENTO;</li><li>PRE\_DATADO;</li><li>CREDITO\_EMISSOR.</li></ul> |
| paymentMode | O | C | Modalidade de pagamento. Valores possíveis:<br/><ul><li>PAGAMENTO\_CARTAO;</li><li>PAGAMENTO\_DINHEIRO;</li><li>PAGAMENTO\_CHEQUE;</li><li>PAGAMENTO\_CARTEIRA\_VIRTUAL.</li></ul> |
| installments | O | N | Número de parcelas. |
| predatedDate | O | AN | Data do pré-datado. |
| fiscalDocument | O | AN | Número do documento fiscal. |
| taxId | O | AN | CPNJ/CPF do estabelecimento. |
| billNumber | O | AN | Número da fatura. |
| phoneNumber | O | AN | Número de telefone, com DDD. |
| posId | O | AN | Identificador do ponto de captura. |
| originalAuthorizationCode | O | AN | Código de autorização original. |
| originalTransactionNsu | O | AN | NSU da transação original. |
| originalTransactionDateTime | O | AN | Data/hora da transação original. |
| additionalPosData1 | O | AN | Dados adicionais relevantes para a automação (#1). |
| additionalPosData2 | O | AN | Dados adicionais relevantes para a automação (#2). |
| additionalPosData3 | O | AN | Dados adicionais relevantes para a automação (#3). |
| additionalPosData4 | O | AN | Dados adicionais relevantes para a automação (#4). |

## Transação – Resposta

A tabela a seguir indica os parâmetros de resposta para uma transação:

| **Parâmetro** | **Presença** | **Formato** | **Descrição** |
| --- | :---: | :---: | --- |
| operation | M | C | Operação realizada. Valores possíveis:<br/><ul><li>VENDA (operação de venda);</li><li>ADMINISTRATIVA (operação administrativa);</li><li>CANCELAMENTO (operação de cancelamento);</li><li>INSTALACAO (operação de instalação);</li><li>REIMPRESSAO (operação de reimpressão do último comprovante);</li><li>RELATORIO\_SINTETICO (obtém relatório sintético);</li><li>RELATORIO\_DETALHADO (obtém relatório detalhado);</li><li>RELATORIO\_RESUMIDO (obtém relatório resumido);</li><li>TESTE\_COMUNICACAO (realiza teste de comunicação);</li><li>EXIBE\_PDC (exibe o número do ponto de captura);</li><li>VERSAO (exibe a versão instalada);</li><li>CONFIGURACAO (operação de configuração);</li><li>MANUTENÇÃO (operação de manutenção).</li></ul> |
| transactionResult | M | N | Resultado da transação efetuada. |
| amount | MC | N | Valor autorizado, para o caso de uma operação de VENDA. |
| currencyCode | MC | N | Código da moeda, de acordo com ISO4217. Mandatório se operação possuir o parâmetro &quot;amount&quot;. |
| requiresConfirmation | M | B | Indica se a transaçao requer ou não confirmação. |
| confirmationTransactionId | MC | AN | Identificador de confirmação para a transação, caso a confirmação seja requerida. |
| cashbackAmount | O | N | Valor do troco. |
| discountAmount | O | N | Valor do desconto. |
| balanceVoucher | O | N | Saldo do cartão _voucher_. |
| dueAmount | O | N | Valor devido. |
| fiscalDocument | O | AN | Número do documento fiscal. |
| transactionNsu | O | AN | NSU do host. |
| terminalNsu | O | AN | NSU local. |
| authorizationCode | O | AN | Código de autorização. |
| transactionId | O | AN | Identificador da transação para a automação. |
| merchantId | O | AN | Identificador do estabelecimento. |
| posId | O | AN | Identificador do ponto de captura. |
| merchantName | O | AN | Nome do estabelecimento em que o ponto de captura está cadastrado. |
| transactionDateTime | O | AN | Data/hora da transação original. |
| installments | O | N | Número de parcelas. |
| predatedDate | O | AN | Data do pré-datado. |
| finType | O | C | Tipo de financiamento. Valores possíveis:<br/><ul><li>FINANCIAMENTO\_NAO\_DEFINIDO;</li><li>A\_VISTA;</li><li>PARCELADO\_EMISSOR;</li><li>PARCELADO\_ESTABELECIMENTO;</li><li>PRE\_DATADO;</li><li>CREDITO\_EMISSOR.</li></ul> |
| providerName | O | AN | Nome do provedor. |
| cardType | O | C | Tipo de cartão. Valores possíveis:<br/><ul><li>CARTAO\_DESCONHECIDO;</li><li>CARTAO\_CREDITO;</li><li>CARTAO\_DEBITO;</li><li>CARTAO\_VOUCHER;</li><li>CARTAO\_PRIVATELABEL;</li><li>CARTAO\_FROTA.</li></ul> |
| cardEntryMode | O | AN | Modo de entrada do cartão. |
| maskedPan | O | AN | Número do cartão, truncado ou mascarado. |
| defaultMaskedPan | O | AN | Número do cartão mascarado no formato BIN + \*\*\* + 4 últimos dígitos. Ex: 543211\*\*\*\*\*\*9876. |
| cardholderVerificationMode | O | AN | Modo de verificação de senha. |
| cardName | O | AN | Nome do cartão ou do emissor do cartão. |
| defaultCardName | O | AN | Descrição do produto bandeira padrão relacionado ao BIN. |
| cardholderName | O | AN | Nome do portador do cartão utilizado. |
| aid | O | AN | Aplicação do cartão utilizada durante a transação. |
| resultMessage | O | AN | Mensagem com descrição do resultado. |
| authorizerResponse | O | AN | Código de resposta da transação, proveniente da rede adquirente. |
| printReceipts | O | C | Vias disponíveis para impressão. Valores possíveis:<br/><ul><li>VIA\_NENHUMA;</li><li>VIA\_CLIENTE;</li><li>VIA\_ESTABELECIMENTO;</li><li>VIA\_CLIENTE\_E\_ESTABELECIMENTO.</li></ul> |
| fullReceipt | O | AN | Comprovente completo. |
| merchantReceipt | O | AN | Comprovante diferenciado lojista. |
| cardholderReceipt | O | AN | Comprovante diferenciado para o portador. |
| shortReceipt | O | AN | Comprovante reduzido para o portador do cartão. |
| graphicReceiptExists | O | B | Indica existência dos comprovantes no formato gráfico. |
| merchantGraphicReceipt | O | AN | Comprovante gráfico, via do lojista. |
| cardholderGraphicReceipt | O | AN | Comprovante gráfico, via do portador. |
| originalTransactionAmount | O | N | Valor da transação original. |
| originalTransactionDateTime | O | AN | Data/hora da transação original. |
| originalTransactionNsu | O | AN | NSU original do host. |
| originalAuthorizationCode | O | AN | Código de autorização original. |
| originalTerminalNsu | O | AN | NSU local gerado na transação original. |
| pendingTransactionExists | O | B | Indica a existência de transação pendente. |
| authorizationMode | O | C | Modalidade da transação. Valores possíveis:<br/><ul><li>ON;</li><li>OFF.</li></ul> |
| paymentMode | O | C | Modalidade de pagamento. Valores possíveis:<br/><ul><li>PAGAMENTO\_CARTAO;</li><li>PAGAMENTO\_DINHEIRO;</li><li>PAGAMENTO\_CHEQUE;</li><li>PAGAMENTO\_CARTEIRA\_VIRTUAL.</li></ul> |
| walletUserId | O | C | Identificação do portador de carteira virtual. Valores possíveis:<br/><ul><li>QRCODE;</li><li>CPF;</li><li>OUTROS.</li></ul> |
| uniqueId | O | AN | Identificador único da transação armazenado no banco de dados. |

## Confirmação – Requisição

A tabela a seguir indica os parâmetros de resposta para uma confirmação:

| **Parâmetro** | **Presença** | **Formato** | **Descrição**                                                                                                                                                                                                                                                                                                                                                                                           |
| --- | :---: | :---: |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| transactionStatus | M | C | Status final da transação. Valores possíveis:<br/><ul><li>CONFIRMADO\_AUTOMATICO (transação confirmada sem intervenção do usuário);</li><li>CONFIRMADO\_MANUAL (transação confirmada a pedido do operador);</li><li>DESFEITO\_MANUAL (transação desfeita a pedido do operador).</li><li>DESFEITO_LIBERACAO_MERCADORIA (transação foi desfeita pela Automação, devido a uma falha no mecanismo de liberação da mercadoria).</li></ul> |
| confirmationTransactionId | M | AN | Identificador de confirmação para a transação (recebido na resposta da transação).                                                                                                                                                                                                                                                                                                                      |

### Exemplo de Confirmação de transação

```dart

  PayGOSdk repository = PayGOSdk();
  await repository.integrado.confirmarTransacao(
    intentAction: IntentAction.confirmation,
    requisicao: TransacaoRequisicaoConfirmacao(
      confirmationTransactionId: '---> Aqui vai o ID da transação <---',
      status: TransactionStatus.confirmadoAutomatico,
    ),
  );

```

## Resolução de Pendência – Requisição

A tabela a seguir indica os parâmetros de resposta para resolução de transação pendente:

| **Parâmetro** | **Presença** | **Formato** | **Descrição** |
| --- | --- | --- | --- |
| providerName | M | AN | Provedor com o qual a transação está pendente. |
| merchantId | M | AN | Identificador do estabelecimento com o qual a transação está pendente. |
| localNsu | M | AN | Obtém o NSU local da transação pendente. |
| transactionNsu | M | AN | Obtém o NSU do servidor TEF da transação pendente. |
| hostNsu | M | AN | Obtém o NSU do provedor da transação pendente. |

### Exemplo de Resolução de Pendência

```dart

  PayGOSdk repository = PayGOSdk();
  await repository.integrado.resolucaoPendencia(
    intentAction: IntentAction.confirmation,
    requisicaoPendencia: '---> Aqui vai a URI da Pendência <---',
    requisicaoConfirmacao: TransacaoRequisicaoPendencia(
      status: TransactionStatus.desfeitoManual,
    ),
  );

```

## Dados Automação

Em todas operações do tipo &quot;Transação&quot;, a Automação deve <ins>obrigatoriamente</ins> também informar seus dados como parâmetro.

Esses dados também são enviados como uma URI, porém em um _Bundle_ separado, identificado com a chave "posData". Os seguintes parâmetros devem ser informados:

| **Parâmetro** | **Presença** | **Formato** | **Descrição** |
| --- | --- | --- | --- |
| posName | M | AN | Nome da Automação. |
| posVersion | M | AN | Versão da Automação. |
| posDeveloper | M | AN | Nome da empresa desenvolvedora da Automação Comercial. |
| allowCashback | M | B | Indica se a Automação suporta a funcionalidade de troco. |
| allowDiscount | M | B | Indica se a Automação suporta a funcionalidade de desconto. |
| allowDifferentReceipts | M | B | Indica se a Automação suporta a impressão de vias diferenciadas para o portador e o lojista. |
| allowShortReceipt | M | B | Indica se a Automação suporta a impressão da via reduzida. |
| allowDueAmount | O | B | Indica se a Automação suporta a utilização do saldo total do voucher para abatimento do valor da compra. Se não informado, assume como &quot;falso&quot;. |

### Exemplo de Requisição de Dados da Automação

```Dart
  TransacaoRequisicaoDadosAutomacao(
    'PAYGO',
    '1.0.0.0',
    'Automação',
    allowCashback: true,
    allowDifferentReceipts: true,
    allowDiscount: true,
    allowDueAmount: true,
    allowShortReceipt: false,
  )
```

## Personalização

Visando fornecer uma experiência visual menos impactante para o usuário, a Automação Comercial pode customizar elementos de interface do cliente PayGo Integrado, de maneira que este tenha uma identidade visual o mais próximo possível da identidade visual da Automação.

Esses dados também são enviados como uma URI, porém em um _Bundle_ separado, identificado com a chave "posCustomization". Os seguintes parâmetros devem ser informados:

| **Parâmetro** | **Presença** | **Formato** | **Descrição** |
| --- | --- | --- | --- |
| screenBackgroundColor | O | AN | Cor de fundo de tela. |
| keyboardBackgroundColor | O | AN | Cor de fundo do teclado. |
| toolbarBackgroundColor | O | AN | Cor de fundo da barra de ferramentas. |
| fontColor | O | AN | Cor da fonte dos textos. |
| editboxBackgroundColor | O | AN | Cor de fundo da caixa de edição de texto. |
| releasedKeyColor | O | AN | Cor das teclas do teclado virtual da aplicação, quando estiverem liberadas. |
| pressedKeyColor | O | AN | Cor das teclas do teclado virtual da aplicação, quando estiverem pressionadas. |
| keyboardFontColor | O | AN | Cor da fonte do teclado. |
| menuSeparatorColor | O | AN | Cor do separador entre o título de um menu e as opções. |
| toolbarIcon | O | AN | Ícone usado na barra de ferramentas. |
| font | O | AN | Fonte utilizada no texto. |

### Exemplo de Requisição de Personalização

```Dart
  TransacaoRequisicaoPersonalizacao(
    screenBackgroundColor = '#F4F4F4',
    keyboardBackgroundColor = '#F4F4F4',
    toolbarBackgroundColor = '#242424',
    fontColor = '#000000',
    editboxBackgroundColor = '#FFFFFF',
    releasedKeyColor = '#dedede',
    pressedKeyColor = '#e1e1e1',
    keyboardFontColor = '#000000',
    menuSeparatorColor = '#F4F4F4',
    toolbarIcon = '',
    font = '',
  )
```

## Exemplos

## Solicitar abertura do menu administrativo

```dart

  Future<void> homeAdministrativoclick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.administrativo();
  }

```

## Solicitar abertura do menu de configuração

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

## Solicitar abertura do menu de manutenção

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

## Solicitar abertura do menu de instalação

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

## Solicitar dados da versão da integração

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

## Iniciar teste de comunicação

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

## Exibir código do PDC

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

## Iniciar uma venda

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

## Autor

Projeto desenvolvido por Claudney Sarti Sessa e Daniel Oliveira Souza

<table>
  <tr>
    <td rowspan="5" style="text-align:center;">
      <img src="https://avatars.githubusercontent.com/u/12506432?v=4" alt="Claudney Sarti Sessa" width="150" height="150" style="border-radius: 50%; display: block; margin: 0 auto;">
    </td>
    <td>GitHub</td>
    <td><a href="https://github.com/claudneysessa">https://github.com/claudneysessa</a></td>
  </tr>
  <tr>
    <td>GitHub Pages</td>
    <td><a href="https://claudneysessa.github.io/">https://claudneysessa.github.io</a></td>
  </tr>
  <tr>
    <td>Instagram</td>
    <td><a href="https://www.instagram.com/claudneysessa/">https://www.instagram.com/claudneysessa</a></td>
  </tr>
  <tr>
    <td>LinkedIn</td>
    <td><a href="https://www.linkedin.com/in/claudneysessa/">https://www.linkedin.com/in/claudneysessa</a></td>
  </tr>
  <tr>
    <td>Gmail</td>
    <td><a href="mailto:claudneysartisessa@gmail.com">claudneysartisessa@gmail.com</a></td>
  </tr>

  <tr>
    <td rowspan="1" style="text-align:center;">
      <img src="https://avatars.githubusercontent.com/u/15186872?v=4" alt="Claudney Sarti Sessa" width="150" height="150" style="border-radius: 50%; display: block; margin: 0 auto;">
    </td>
    <td>GitHub</td>
    <td><a href="https://github.com/dosza">https://github.com/dosza</a></td>
  </tr>
  </tr>
</table>

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](https://github.com/claudneysessa/DartPad/blob/master/LICENSE) para mais detalhes.
