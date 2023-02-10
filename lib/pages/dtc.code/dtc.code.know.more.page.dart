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
                text: '* P \n'
                    'ECM/ICM (Módulo de Controle Eletrônico [EFI]/'
                    'Módulo de Controle de Ignição [Carburadas])\n\n'
                    '* S \n'
                    'TSM/TSSM (Módulo de Sinal (Setas)/Segurança)\n\n'
                    '* SP \n'
                    'Velocímetro\n\n'
                    '* T\n'
                    'Tacômetro. \n\n'),
            const TextSpan(
                text: '6 - Para obter o DTC em uma área de diagnóstico, '
                    'pressione e segure o botão de reset do hodômetro ou o TRIP por 5 '
                    'segundos e solte.  Se houver qualquer DTC, o código será '
                    'exibido ou a palavra "NONE" aparecerá se não houver DTC.  '
                    'Pressione o botão de reset do hodômetro ou o TRIP '
                    'novamente para visualizar os códigos adicionais, se houver. \n\n'),
            const TextSpan(
              text: '7 - Anote os códigos.\n\n',
            ),
            const TextSpan(
                text: '8 - Se os DTCs não forem apagados, pressione e solte o '
                    'botão de reset do odômetro ou o TRIP.  O número da peça '
                    '(Part Number) [PNxxxxx-xx] do módulo com problema '
                    'será exibido.\n\n'),
            const TextSpan(
                text:
                    'NOTA: Para determinar se um código é atual ou histórico, '
                    'limpe o código exibido pressionando e segurando o botão de '
                    'reset do hodômetro ou o TRIP (mais de 5 segundos) até '
                    'a palavra "CLEAR" aparecer.  Solte o botão de reset do '
                    'odômetro ou o TRIP. Desligui a chave de ignição.  Ligue sua'
                    'motocicleta e desligue-a. Em seguida, verifique novamente os '
                    'DTCs, repetindo as etapas 1 a 9. Se o código for atual, '
                    'ele reaparecerá.\n\n'),
            const TextSpan(
                text:
                    '9 - Pressione e solte o botão de reset do odômetro ou o TRIP '
                    'para passar para o próximo módulo.\n\n'),
            const TextSpan(
              text: '10 - Gire a chave de ignição para OFF.\n\n',
            ),
            const TextSpan(
                text: 'Nos modelos não equipados com tacômetro, "NO RSP" (sem '
                    'resposta) aparecerá quando o identificador do tacômetro '
                    'for selecionado.\n\n'),
            const TextSpan(
                text: '"NO RSP" também aparecerá se a chave ON/OFF estiver '
                    'na posição OFF ao executar este procedimento.'),
          ],
        ),
      );
}
