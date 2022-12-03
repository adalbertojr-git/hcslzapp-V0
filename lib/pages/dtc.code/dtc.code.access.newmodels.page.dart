import 'package:flutter/material.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Códigos DTC a partir de 2005';

class DtcCodeAccessNewModelsPage extends StatelessWidget {
  //@override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
        body: ListView(
          children: <Widget>[
            Container(
              //color: Colors.white,
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

  _disclaimer() => RichText(
        textAlign: TextAlign.justify,
        text: const TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            text: 'AVISO: as informações abaixo são apenas para referência.  '
                'Este aplicativo não pretende sugerir quaisquer soluções técnicas '
                'para códigos de problemas de diagnóstico.  O procedimento a '
                'seguir instruirá na recuperação e eliminação dos códigos de '
                'diagnóstico de problemas de alguns modelos HD, mas'
                ' pode não funcionar no seu.  Caso contrário, envie-nos um '
                'feedback .'),
      );

  _paragraphs() => RichText(
        textAlign: TextAlign.justify,
        text: const TextSpan(
          text:
              '1- Gire a chave de ignição para OFF e veja se a chave Run/Stop está '
              'na posição Run.\n\n',
          children: <TextSpan>[
            const TextSpan(
                text:
                    '2- Pressione o botão de reset do hodômetro e mantenha-o pressionado.'
                    'Para os modelos de 2014 ou mais recentes, pressione'
                    'o botão TRIP este é o botão de alternância e de seleção.\n\n'),
            const TextSpan(
                text:
                    '3- Gire o interruptor de ignição para Ignition e solte o '
                    'botão de reset do odômetro ou o TRIP. A iluminação de fundo deve '
                    'acender, a agulha do velocímetro deve percorrer todo o seu '
                    'alcance e as lâmpadas indicadoras (bateria, segurança, '
                    'combustível baixo, verificar motor e cruzeiro) devem acender.  '
                    'A palavra "DIAG" deve aparecer.\n\n '),
            const TextSpan(
                text:
                    '4 - Pressione o botão de reset do hodômetro ou o TRIP uma vez e você '
                    'verá o menu de seleção "PSSP +" com o primeiro P piscando.\n\n '),
            const TextSpan(
                text:
                    '5 - Cada letra representa uma área do módulo de diagnóstico.  '
                    'O módulo que está piscando é o que você vai verificar. Para '
                    'passar de uma letra (módulo) para a próxima, pressione '
                    'o botão de reset do hodômetro ou o TRIP uma vez.  '
                    '(de P para S, para SP, para T e de volta para P, etc.) \n\n'),
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
