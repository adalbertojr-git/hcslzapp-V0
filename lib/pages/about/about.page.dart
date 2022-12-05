import 'package:flutter/material.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Sobre o Harley Club';
const String _pathLogoImage = 'assets/imgs/logo.png';
const String _pathAboutImage = 'assets/imgs/sobre.jpeg';

class AboutPage extends StatelessWidget {
  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_title),
      bottomNavigationBar: MyBottomAppBar(),
      body: _widgets(),
    );
  }

  _widgets() => ListView(
    children: <Widget>[
      SizedBox(
        height: 200.0,
        child: Image.asset(_pathLogoImage),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(00.0, 10.0, 00.0, 10.0),
        child: Image.asset(_pathAboutImage),
      ),
      _buildText(),
    ],
  );

  Widget _buildText() {
    return Text.rich(
      const TextSpan(
        text:
            'A história do Harley Club começou em 2012 pela necessidade de se fazer '
            'revisões em nossas máquinas, pois até hoje, São Luís não dispõe de '
            'uma concessionária Harley Davidson®. Então, foi criado um grupo de '
            'WhatsApp®, chamado de "Revisões HD", dessa maneira veio o mecânico '
            'da Newroad Fortaleza (Concessionária Harley Davidson localizada em '
            'Fortaleza-CE), onde a primeira revisão aconteceu na residência do '
            'Harleyro Ruy Palhano.\n\n',
        children: <TextSpan>[
          const TextSpan(
              text: 'Dessa maneira a turma foi crescendo, e com as revisões, '
                  'gerou uma maior aproximação dos amigos e amantes da marca, '
                  'promovendo uma interação e a necessidade de trocar ideias sobre o '
                  'mundo 2 rodas e consequentemente, a realização de passeios entre '
                  'os membros.\n\n '),
          const TextSpan(
            text:
                'O grupo já estava com um bom número de participantes nos comboios '
                'e passeios, daí, em busca do aperfeiçoamento da pilotagem e com '
                'o objetivo de maior organização e segurança, alguns integrantes '
                'viajaram e participaram de cursos de ‘Road Captain’ e pilotagem '
                'módulos I, II e III em Fortaleza. Posteriormente, foi ofertado '
                'os mesmos cursos na cidade de São Luís-MA para os interessados.\n\n',
          ),
          const TextSpan(
            text: 'Assim, bem de mansinho, formou-se um Moto Grupo.\n\n',
          ),
          const TextSpan(
            text:
                'Já no ano de 2014 o nome passou a ser ‘Harley Club São Luís.\n\n',
          ),
          const TextSpan(
              text: 'Com todo esse pessoal rodando pela cidade, encheram-se de '
                  'coragem e esperança vários amantes sonhadores, que puderam '
                  'tornar seus sonhos realidade, desfilando suas máquinas juntos em '
                  'um Moto Grupo.\n\n'),
          const TextSpan(
              text:
                  'Assim nasce oficialmente, no ano de 2018, o Harley Club com seu registro '
                  'oficial, cerimônia com o escudamento de 71 membros oficiais que '
                  'receberam seus coletes e fizeram seu juramento numa demonstração '
                  'de amor pelo grupo. Hoje o Harley Club é o maior grupo de motociclismo '
                  'do Maranhão.\n\n'),
          const TextSpan(
            text: 'Localização: São Luís-MA, Brasil\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: 'Email : contato@harleyclubslz.com.br\n\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: 'Palavra do Presidente\n\n',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),
          const TextSpan(
            text: '...\n\n',
            style: TextStyle(
              color: Colors.blueGrey,
              fontStyle: FontStyle.italic,
            ),
          ),
          const TextSpan(
            text: 'Sebba.',
            style: TextStyle(
              color: Colors.blueGrey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
