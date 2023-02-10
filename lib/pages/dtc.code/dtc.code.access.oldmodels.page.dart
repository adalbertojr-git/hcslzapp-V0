import 'package:flutter/material.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Até 2004';

class DtcCodeAccessOldModelsPage extends StatelessWidget {
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
            text: 'AVISO: as informações abaixo são apenas para referência.  '
                'Este aplicativo não pretende sugerir quaisquer soluções técnicas '
                'para códigos de problemas de diagnóstico.  O procedimento a '
                'seguir instruirá na recuperação e eliminação dos códigos de '
                'diagnóstico de problemas de alguns modelos HD, mas'
                ' pode não funcionar no seu.  Caso contrário, envie-nos um '
                'feedback .'),
      );

  _paragraphs() => Text.rich(
        const TextSpan(
          text: 'Entre na área de diagnóstico girando a ignição de OFF para '
              'ON enquanto mantém o botão de reinicialização pressionado. '
              'A sequência normal de inicialização ocorrerá antes de entrar no '
              'modo de diagnóstico.  Os códigos de diagnóstico definidos durante '
              'esta sequência de inicialização também serão armazenados.\n\n',
          children: <TextSpan>[
            const TextSpan(
                text: 'Nota importante: Certifique-se de que nenhum código '
                    'de diagnóstico seja indicado antes que a reinicialização '
                    'seja mantida por mais de 5 segundos ou as informações de '
                    'diagnóstico serão perdidas.\n\n'),
            const TextSpan(
                text: 'Quando no modo de diagnóstico, o odômetro exibirá o '
                    'primeiro código de diagnóstico. Quando o interruptor de desarme for '
                    'pressionado novamente, o próximo código será mostrado.  Se o '
                    'interruptor de desarme for pressionado por mais de 5 segundos a '
                    'qualquer momento durante o modo de diagnóstico, o código de '
                    'iagnóstico exibido será apagado.\n\n '),
            const TextSpan(
                text:
                    'Existem 7 códigos de diagnóstico diferentes disponíveis.  '
                    'Eles são os seguintes:\n\n '),
            const TextSpan(
                text:
                    'd01 - Saída de energia do sensor de velocidade em curto \n'
                    'd02 - Saída de energia do sensor de velocidade em curto aberto \n'
                    'd05 - Retorno do sensor de velocidade em curto \n'
                    'd06 - Retorno do sensor de velocidade em curto \n'
                    'd08 - Potência do velocímetro sobre tensão \n'
                    'd09 - Saída de velocidade em curto-circuito alta \n'
                    'd10 - Saída de velocidade em curto ou aberta \n\n'
                    'd03 - Não Usado \n'
                    'd04 - Não usado \n'
                    'd07 - Não Usado \n\n'
                    'CAL XX - Número de calibração da aplicação do velocímetro: \n\n'
                    '14 = Doméstico \n'
                    '15 = HDI \n\n'),
            const TextSpan(
                text:
                    'Quando no modo de diagnóstico, todos os códigos são exibidos '
                    'na sequência de d01 a d10.  Conforme um código aparece no visor '
                    '(por exemplo, d02), ele lerá "d02Set" se definido ou "d02CLr" '
                    'se estiver limpo. \n\n'),
            const TextSpan(
                text:
                    'O modo de diagnóstico é encerrado girando a ignição de ON '
                    'para OF e para ON novamente sem pressionar o interruptor de '
                    'reinicialização ou se um sinal de velocidade maior que 5 MPH '
                    'for detectado. \n\n'),
            const TextSpan(
                text:
                    'Os diagnósticos não podem ser realizados se a tensão do sistema for '
                    'inferior a 9 VCC ou superior a 16 VCC.  A única exceção é d08, que é '
                    'definido quando a tensão do sistema é superior a 16 VCC. Depois que todos '
                    'os códigos de diagnóstico são exibidos, o número de calibração do '
                    'velocímetro é exibido (CAL 14 por exemplo).'),
          ],
        ),
      );
}
