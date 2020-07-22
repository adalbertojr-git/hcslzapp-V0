/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto Dependente

*/
class Dependente {
  final int codigo;
  final String nome;
  final String email;
  final String telefone;
  final String tipoSanguineo;
  final String dataNascimento;
  final String membroHc;

  Dependente(this.codigo, this.nome, this.email, this.telefone,
      this.tipoSanguineo, this.dataNascimento, this.membroHc);

  Dependente.fromJson(Map<String, dynamic> json)
      : codigo = json['codigo'],
        nome = json['nome'],
        email = json['email'],
        telefone = json['telefone'],
        tipoSanguineo = json['tipoSanguineo'],
        dataNascimento = json['dataNascimento'],
        membroHc = json['membroHc'];

  Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'tipoSanguineo': tipoSanguineo,
        'dataNascimento': dataNascimento,
        'membroHc': membroHc,
      };

  @override
  String toString() {
    return 'Dependente{codigo: $codigo, nome: $nome, email: $email, telefone: $telefone, '
        'tipoSanguineo: $tipoSanguineo, dataNascimento: $dataNascimento, '
        'membroHc: $membroHc}';
  }
}
