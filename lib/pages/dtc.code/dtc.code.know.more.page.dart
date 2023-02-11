import 'package:flutter/material.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Saiba Mais';

class DtcCodeKnowMorePage extends StatelessWidget {
  //@override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: _disclaimer(),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: _paragraphs(),
            ),
          ],
        ),
      );

  _disclaimer() => Text.rich(
        const TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            text:
                'Oh não!!! Todos nós já sentimos essa angústia. A luz do mecanismo de '
                'verificação (CEL) em seu painel acende e sua Harley-Davidson não '
                'está funcionando corretamente. Ou, o que pode ser ainda mais confuso, '
                'a luz acende, mas a moto parece estar bem. O que você deve fazer, '
                'o que isso significa? Isso é motivo para reboque? A moto pode operar '
                'normalmente até que você possa colocá-la em uma oficina?'),
      );

  _paragraphs() => Text.rich(
        const TextSpan(
          text:
              'Essas perguntas são muito comuns quando a luz do motor de verificação '
              'da Harley-Davidson permanece acesa. Continue lendo abaixo para saber um pouco '
              'mais sobre os códigos de problema associados ao CEL.\n\n',
          children: <TextSpan>[
            const TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                text: 'O que significa uma luz de verificação do motor?\n\n'),
            const TextSpan(
                text:
                    'Uma luz acesa do mecanismo de verificação é uma indicação de '
                    'que o sistema de diagnóstico a bordo da motocicleta detecta '
                    'um código de problema atual ou histórico, conhecido como '
                    'códigos de diagnóstico de problemas '
                    '(Diagnostic Trouble Codes - DTC)\n\n'),
            const TextSpan(
                text:
                    'Antes exclusivas da indústria automotiva, fabricantes de '
                    'motocicletas como a Harley-Davidson contam com diagnósticos a '
                    'bordo para auxiliar proprietários e técnicos quando ocorre uma falha.\n\n'),
            const TextSpan(
                text:
                    'Se o módulo de controle eletrônico do veículo detectar um erro '
                    'no sistema, ele “lança um código”, fazendo com que a luz do '
                    'mecanismo de verificação acenda. Um DTC é uma informação direcional '
                    'para um proprietário ou técnico iniciar o trabalho de diagnóstico. '
                    'A presença de um código não significa que você deve começar a '
                    'substituir as peças. Um departamento de serviço da concessionária Harley-Davidson '
                    'ou outro técnico qualificado é sua melhor aposta se você não se sentir '
                    'confortável ou experiente em diagnosticar problemas elétricos.\n\n'),
            const TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                text: 'Categorias de códigos DTC Harley:\n\n'),
            const TextSpan(
                text: '* Engine Control Module (ECM)\n'
                    '* Body Control Module (BCM)\n'
                    '* Speedometer (SPDO)\n'
                    '* Radio (RAD)\n'
                    '* Anti-Lock Braking System (ABS)\n'
                    '* Turn Signal Security Module (TSSM)\n\n'),
            const TextSpan(
                text: 'Existem basicamente três tipos de códigos:\n\n '
                    '* Atuais - Os códigos atuais são exibidos quando o sistema '
                    'detecta uma falha ativa. Simplesmente limpar o código não '
                    'resolverá o problema, pois o código retornará assim que ocorrerem '
                    'ciclos de acionamento suficientes nos quais o sistema '
                    'reconheça a falha novamente. '
                    'novamente para visualizar os códigos adicionais, se houver. \n\n'),
            const TextSpan(
                text:
                    '* Históricos - Os códigos históricos permanecem salvos até que '
                    'sejam intencionalmente apagados ou cerca de 40 ciclos de ignição '
                    '(ligar/desligar) sem recorrência. Os códigos históricos ajudam '
                    'com problemas ou falhas intermitentes.\n\n'),
            const TextSpan(
                text:
                    '* Pendentes - Os códigos pendentes registram quando o sistema '
                    'detecta uma falha, mas a falha não ocorreu durante ciclos de '
                    'acionamento suficientes para definir a corrente. Se a falha for '
                    'resolvida, o código se tornará um código histórico, '
                    'ignorando o status atual.\n\n'),
            const TextSpan(
                text:
                    'O autodiagnóstico do odômetro exibe todos os códigos e diferencia '
                    'entre atual e histórico com um designador de letra. Os DTCs atuais '
                    'residem na memória do ECM, BCM, instrumentos, rádio ou módulo ABS '
                    '(se equipado) até que o DTC seja resolvido.\n\n'),
            const TextSpan(
                text:
                    'Se um problema específico for resolvido, o problema de status ativo '
                    'será descartado e se tornará um DTC histórico em vez de um DTC '
                    'atual. Os DTCs também perderão o status atual quando a '
                    'ignição for desligada.\n\n'),
            const TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                text:
                    'Todos os DTCs recebem um número de prioridade para determinar a '
                    'ordem em que devem ser diagnosticados. Se houver vários DTCs '
                    'presentes, sempre diagnostique primeiro a prioridade mais alta.\n\n'),
          ],
        ),
      );
}
