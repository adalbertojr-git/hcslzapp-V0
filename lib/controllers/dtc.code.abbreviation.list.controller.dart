import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'dtc.code.abbreviation.list.controller.g.dart';

class DtcCodeAbbreviationListController = DtcCodeAbbreviationListControllerBase
    with _$DtcCodeAbbreviationListController;

abstract class DtcCodeAbbreviationListControllerBase with Store {
  @observable
  var codeCtrl = TextEditingController();

  @observable
  ObservableList abbreviations = [].asObservable();

  @observable
  String filter = '';

  get init {
    abbreviations.clear();
    List<Abbreviation> abbreviationsList = [
      Abbreviation(
          code: 'ABS',
          description: 'Anti-Lock Braking System',
          translation: 'Sistema De Freio Anti-Bloqueio'),
      Abbreviation(
          code: 'ACR',
          description: 'Automatic Compression Release',
          translation: 'Liberação Automática de Compressão'),
      Abbreviation(
          code: 'AFR',
          description: 'Air Fuel Ratio',
          translation: 'Taxa De Combustível do Ar'),
      Abbreviation(
          code: 'AIS',
          description: 'Active Intake Solenoid',
          translation: 'Solenoide de Admissão Ativo'),
      Abbreviation(
          code: 'ATS',
          description: 'Air Temperature Sensor',
          translation: 'Sensor de Temperatura do Ar'),
      Abbreviation(
          code: 'BAS',
          description: 'Bank Angle Sensor',
          translation: 'Sensor de Ângulo do Banco'),
      Abbreviation(
          code: 'BCM',
          description: 'Body Control Module',
          translation: 'Módulo de Controle Corporal'),
      Abbreviation(
          code: 'CAN',
          description: 'Controller Area Network',
          translation: 'Rede da Área do Controlador'),
      Abbreviation(
          code: 'CCM',
          description: 'Cruise Control Module',
          translation: 'Módulo de Controle de Cruzeiro'),
      Abbreviation(
          code: 'CKP',
          description: 'Crank Position Sensor',
          translation: 'Sensor de Posição de Manivela'),
      Abbreviation(
          code: 'DLC',
          description: 'Datalink Connector',
          translation: 'Conector Datalink'),
      Abbreviation(
          code: 'DTC',
          description: 'Diagnostic Trouble Codes',
          translation: 'Códigos de Diagnóstico de Problemas'),
      Abbreviation(
          code: 'ECM',
          description: 'Electronic Control Module',
          translation: 'Módulo de Controle Eletrônico'),
      Abbreviation(
          code: 'ECT',
          description: 'Engine Coolant Temperature',
          translation: 'Temperatura do Líquido de Arrefecimento do Motor'),
      Abbreviation(
          code: 'ECU',
          description: 'Electronic Control Unit',
          translation: 'Unidade de Controle Eletrônico'),
      Abbreviation(
          code: 'EFI',
          description: 'Electronic Fuel Injection',
          translation: 'Injeção Eletrônica de Combustível'),
      Abbreviation(
          code: 'EFP',
          description: 'Electronic Fuel Pump',
          translation: 'Bomba Eletrônica de Combustível'),
      Abbreviation(
          code: 'ET',
          description: 'Engine Temperature Sensor',
          translation: 'Sensor de Temperatura do Motor'),
      Abbreviation(
          code: 'FI',
          description: 'Fuel Injectors',
          translation: 'Injetores de Combustível'),
      Abbreviation(
          code: 'FPR',
          description: 'Fuel Pressure regulator',
          translation: 'Regulador de Pressão de Combustível'),
      Abbreviation(
          code: 'H-DSSS',
          description: 'Harley-Davidson Smart Security System',
          translation: 'Sistema de Segurança Inteligente Harley-Davidson'),
      Abbreviation(
          code: 'HCU',
          description: 'Hydraulic Control Unit, ABS',
          translation: 'Unidade de Controle Hidráulica, ABS'),
      Abbreviation(
          code: 'HFSM',
          description: 'Hands Free Security Module',
          translation: 'Módulo de Segurança Mãos Livres'),
      Abbreviation(
          code: 'HO2S',
          description: 'Heated Oxygen Sensor',
          translation: 'Sensor de Oxigênio Aquecido'),
      Abbreviation(
          code: 'IAC',
          description: 'Idle Air Control actuator',
          translation: 'Atuador de Controle de Ar Ocioso'),
      Abbreviation(
          code: 'IAT',
          description: 'Intake Air Temperature sensor',
          translation: 'Sensor de Temperatura do Ar de Admissão'),
      Abbreviation(
          code: 'ICM',
          description: 'Ignition Control Module',
          translation: 'Módulo de Controle de Ignição'),
      Abbreviation(
          code: 'IMAP',
          description: 'MAP + IAT in one unit',
          translation: 'MAP + IAT em uma Unidade'),
      Abbreviation(
          code: 'ISS',
          description: 'Ion Sensing System',
          translation: 'Sistema Ion Sensing'),
      Abbreviation(
          code: 'JSS',
          description: 'Jiffy Stand Sensor',
          translation: 'Sensor de Suporte do Pezinho'),
      Abbreviation(
          code: 'LHCM',
          description: 'Left Hand Control Module',
          translation: 'Módulo de Controle da Mão Esquerda'),
      Abbreviation(
          code: 'MAP',
          description: 'Manifold Absolute Pressure Sensor',
          translation: 'Sensor de Pressão Absoluta do Manifold'),
      Abbreviation(
          code: 'MHR',
          description: 'Right Hand Control Module',
          translation: 'Módulo de Controle da Mão Direita'),
      Abbreviation(
          code: 'RCM',
          description: 'Reverse Control Module',
          translation: 'Módulo de Controle Reverso'),
      Abbreviation(
          code: 'TCA',
          description: 'Throttle Control Actuato',
          translation: 'Atuador de Controle de Aceleração'),
      Abbreviation(
          code: 'TGS',
          description: 'Twist Grip Sensor',
          translation: 'Sensor Twist Grip'),
      Abbreviation(
          code: 'TMAP',
          description: 'Intake Air Temperature/Manifold Absolute Pressure equipment',
          translation: 'Equipamento de Pressão Absoluta do Ar de Admissão'),
      Abbreviation(
          code: 'TPS',
          description: 'Throttle Position Sensor',
          translation: 'Sensor de Posição do Acelerador'),
      Abbreviation(
          code: 'TSM/TSSM',
          description: 'Turn Signal/Turn Signal Security Module',
          translation: 'Seta/Módulo se Segurança De Sinalização (Triângulo)'),
      Abbreviation(
          code: 'VE',
          description: 'Volume Efficiency',
          translation: 'Eficiência de Volume'),
      Abbreviation(
          code: 'VIN',
          description: 'Vehicle identification number',
          translation: 'Número de Identificação do Veículo (Chassis)'),
      Abbreviation(
          code: 'VSS',
          description: 'Vehicle Speed Sensor',
          translation: 'Sensor de Velocidade do Veículo'),
      Abbreviation(
          code: 'WSS',
          description: 'Wheel Speed Sensor',
          translation: 'Sensor De Velocidade da Roda'),
    ];
    abbreviations.addAll(abbreviationsList);
  }

  @action
  setFilter(String value) => filter = value.toUpperCase();

  @computed
  List<Abbreviation> get listFiltered {
    if (filter.isEmpty) {
      return List<Abbreviation>.from(abbreviations);
    } else {
      return List<Abbreviation>.from(
          abbreviations.where((element) => element.code.contains(filter)));
    }
  }
}

class Abbreviation {
  String code;
  String description;
  String translation;

  Abbreviation({this.code, this.description, this.translation});
}
