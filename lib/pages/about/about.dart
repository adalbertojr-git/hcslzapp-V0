/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que exibe infos sobre o Harley Club

*/
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hcslzapp/components/my.appbar.dart';

const _titleAppBar = 'Sobre o Harley Club';

class About extends StatelessWidget {
  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_titleAppBar),
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
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/imgs/logo_sobre.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(00.0, 00.0, 00.0, 10.0),
                child: Image.asset('assets/imgs/sobre.jpeg'),
              ),
              _buildText(),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildText() {
    return RichText(
      text: TextSpan(
        text:
            'A história do Harley Club começou em 2012 pela necessidade de se fazer '
            'revisões em nossas máquinas, pois até hoje, São Luís não dispõe de '
            'uma concessionária Harley Davidson®. Então, foi criado um grupo de '
            'WhatsApp®, chamado de "Revisões HD", dessa maneira veio o mecânico '
            'da Newroad Fortaleza (Concessionária Harley Davidson localizada em '
            'Fortaleza-CE), onde a primeira revisão aconteceu na residência do '
            'Harleyro Ruy Palhano.\n\n',
        style: const TextStyle(color: Colors.black87),
        children: <TextSpan>[
          TextSpan(
              text: 'Dessa maneira a turma foi crescendo, e com as revisões, '
                  'gerou uma maior aproximação dos amigos e amantes da marca, '
                  'promovendo uma interação e a necessidade de trocar ideias sobre o '
                  'mundo 2 rodas e consequentemente, a realização de passeios entre '
                  'os membros.\n\n '),
          TextSpan(
            text:
                'O grupo já estava com um bom número de participantes nos comboios '
                'e passeios, daí, em busca do aperfeiçoamento da pilotagem e com '
                'o objetivo de maior organização e segurança, alguns integrantes '
                'viajaram e participaram de cursos de ‘Road Captain’ e pilotagem '
                'módulos I, II e III em Fortaleza. Posteriormente, foi ofertado '
                'os mesmos cursos na cidade de São Luís-MA para os interessados.\n\n',
          ),
          TextSpan(
            text: 'Assim, bem de mansinho, formou-se um Moto Grupo.\n\n ',
          ),
          TextSpan(
            text:
                'Já no ano de 2014 o nome passou a ser ‘Harley Club São Luís’.\n\n',
          ),
          TextSpan(
              text: 'Com todo esse pessoal rodando pela cidade, encheram-se de '
                  'coragem e esperança vários amantes sonhadores, que puderam '
                  'tornar seus sonhos realidade, desfilando suas máquinas juntos em '
                  'um Moto Grupo.\n\n'),
          TextSpan(
              text:
                  'Assim nasce oficialmente, no ano de 2018, o Harley Club com seu registro '
                  'oficial, cerimônia com o escudamento de 71 membros oficiais que '
                  'receberam seus coletes e fizeram seu juramento numa demonstração '
                  'de amor pelo grupo. Hoje o Harley Club é o maior grupo de motociclismo '
                  'do Maranhão.\n\n'),
          TextSpan(
            text: 'Localização: São Luís-MA, Brasil\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Email : contato@harleyclubslz.com.br\n\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Palavra do Presidente\n\n',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextSpan(
            text: '"..."\n\n',
            style: TextStyle(
              color: Colors.blueGrey,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextSpan(
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
