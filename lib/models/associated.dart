/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto Associado

*/
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';

class Associado {
  final int codigo;
  final String nome;
  final String email;
  final String telefone;
  final Associado padrinho;
  final String apelido;
  final String cnh;
  final String cpf;
  final String rg;
  final String tipoSanguineo;
  final String tipoAssociado;
  final String dataNascimento;
  final String dataEscudamento;
  final List<Dependente> dependentes;
  final List<Motocicleta> motocicletas;

  Associado(
      this.codigo,
      this.nome,
      this.email,
      this.telefone,
      this.padrinho,
      this.apelido,
      this.cnh,
      this.cpf,
      this.rg,
      this.tipoSanguineo,
      this.tipoAssociado,
      this.dataNascimento,
      this.dataEscudamento,
      this.dependentes,
      this.motocicletas);

  Associado.fromJson(Map<String, dynamic> json)
      : codigo = json['codigo'],
        nome = json['nome'],
        email = json['email'],
        telefone = json['telefone'],
        padrinho = json["padrinho"] == null ? null : Associado.fromJson(json["padrinho"]),
        apelido = json['apelido'],
        cnh = json['cnh'],
        cpf = json['cpf'],
        rg = json['rg'],
        tipoSanguineo = json['tipoSanguineo'],
        tipoAssociado = json['tipoAssociado'],
        dataNascimento = json['dataNascimento'],
        dataEscudamento = json['dataEscudamento'],
        dependentes = List.from((json['dependentes'] as List)
            .map((dependentes) => Dependente.fromJson(dependentes))),
        motocicletas = List.from((json['motocicletas'] as List)
            .map((motocicletas) => Motocicleta.fromJson(motocicletas)));

  Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'padrinho': padrinho == null ? null : padrinho.toJson(),
        'apelido': apelido,
        'cnh': cnh,
        'cpf': cpf,
        'rg': rg,
        'tipoSanguineo': tipoSanguineo,
        'tipoAssociado': tipoAssociado,
        'dataNascimento': dataNascimento,
        'dataEscudamento': dataEscudamento,
        'dependentes': List<dynamic>.from(
            dependentes.map((depedentes) => depedentes.toJson())),
        'motocicletas': List<dynamic>.from(
            motocicletas.map((motocicletas) => motocicletas.toJson())),
      };

  @override
  String toString() {
    return 'Associado{codigo: $codigo, nome: $nome, email: $email, telefone: $telefone, '
        'apelido: $apelido, cnh: $cnh, cpf: $cpf, rg: $rg, '
        'tipoSanguineo: $tipoSanguineo, dataNascimento: $dataNascimento, '
        'dataEscudamento: $dataEscudamento}';
  }
}