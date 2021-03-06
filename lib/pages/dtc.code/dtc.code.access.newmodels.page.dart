import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/top.margin.dart';

class DtcCodeAccessNewModelsPage extends StatelessWidget {
  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TopMargin(),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: _disclaimer,
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: _paragraphs,
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(
        icon: Icons.arrow_back,
        onClick: () => Navigator.of(context).pop(),
      ),
    );
  }

  get _disclaimer => RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            text: 'AVISO: as informações abaixo são apenas para referência.  '
                'Este aplicativo não pretende sugerir quaisquer soluções técnicas '
                'para códigos de problemas de diagnóstico.  O procedimento a '
                'seguir instruirá na recuperação e eliminação dos códigos de '
                'diagnóstico de problemas de alguns modelos HD, mas'
                ' pode não funcionar no seu.  Caso contrário, envie-nos um '
                'feedback .'),
      );

  get _paragraphs => RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: TextStyle(color: Colors.black),
          text:
              '1- Gire a chave de ignição para OFF e veja se a chave Run/Stop está '
              'na posição Run.\n\n',
          children: <TextSpan>[
            TextSpan(
                text:
                    '2- Pressione o botão de reset do hodômetro e mantenha-o pressionado.\n\n'),
            TextSpan(
                text:
                    '3- Gire a chave de ignição para Ignição e solte o botão de '
                    'reinicialização do hodômetro.  A iluminação de fundo deve '
                    'acender, a agulha do velocímetro deve percorrer todo o seu '
                    'alcance e as lâmpadas indicadoras (bateria, segurança, '
                    'combustível baixo, verificar motor e cruzeiro) devem acender.  '
                    'A palavra "diag" deve então aparecer.\n\n '),
            TextSpan(
                text:
                    '4 - Pressione o botão de reset do hodômetro uma vez e você '
                    'verá o menu de seleção "PSSP +" com o primeiro P piscando.\n\n '),
            TextSpan(
                text:
                    '5 - Cada letra representa uma área do módulo de diagnóstico.  '
                    'O módulo que está piscando é o que você vai verificar. Para '
                    'passar de uma letra (módulo) para a próxima, você pressiona '
                    'o botão de reinicialização do hodômetro uma vez.  '
                    '(de P para S para SP para t e de volta para P, etc.) \n\n'),
            TextSpan(
                text: 'P = ECM/ICM (Módulo de Controle Eletrônico [EFI]/'
                    'Módulo de Controle de Ignição [Carburadas])\n'
                    'S = TSM/TSSM (Turn Signal/Turn Signal Security Module)\n'
                    'SP = velocímetro\n'
                    'T = tacômetro. \n\n'),
            TextSpan(
                text: '6 - Para obter o DTC dentro de uma área de diagnóstico, '
                    'pressione e segure o botão de reset do hodômetro por 5 '
                    'segundos e solte.  Se houver qualquer DTC, o código será '
                    'exibido ou a palavra "nenhum" aparecerá se não houver DTC.  '
                    'Pressione o botão de reinicialização do hodômetro '
                    'novamente para visualizar os códigos adicionais, se houver. \n\n'),
            TextSpan(
              text: '7 - Registre os códigos.\n\n',
            ),
            TextSpan(
                text: '8 - Se os DTCs não forem apagados, pressione e solte o '
                    'botão de reset do odômetro.  O número da peça do módulo '
                    'será exibido.\n\n'),
            TextSpan(
                text:
                    'NOTA: Para determinar se um código é atual ou histórico, '
                    'limpe o código exibido pressionando e segurando o botão de '
                    'reinicialização do hodômetro (mais de 5 segundos) até '
                    'CLEAR aparecer.  Solte o botão de reinicialização do odômetro.  '
                    'DESLIGUE a chave de ignição.  Ligue sua motocicleta e desligue-a, '
                    'em seguida, verifique novamente os DTCs, repetindo as etapas 1 a 9. '
                    'Se o código for atual, ele reaparecerá.\n\n'),
            TextSpan(
                text: '9 - Pressione e solte o botão de reset do odômetro para '
                    'passar para o próximo módulo.\n\n'),
            TextSpan(
              text: '10 - Gire a chave de ignição para OFF.\n\n',
            ),
            TextSpan(
                text:
                    'Nos modelos não equipados com tacômetro, "No Rsp" aparecerá '
                    'quando o identificador do tacômetro for selecionado.\n\n'),
            TextSpan(
                text:
                    '"No Rsp" também aparecerá se a chave liga / desliga estiver '
                    'na posição desligada ao executar este procedimento.'),
          ],
        ),
      );
}
