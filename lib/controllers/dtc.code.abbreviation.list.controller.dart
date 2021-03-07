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
          translation: 'SISTEMA DE FREIO ANTI-BLOQUEIO'),
      Abbreviation(
          code: 'ACR',
          description: 'Automatic Compression Release',
          translation: 'LIBERAÇÃO AUTOMÁTICA DE COMPRESSÃO'),
      Abbreviation(
          code: 'AFR',
          description: 'Air Fuel Ratio',
          translation: 'TAXA DE COMBUSTÍVEL DO AR'),
      Abbreviation(
          code: 'AIS',
          description: 'Active Intake Solenoid',
          translation: 'SOLENOIDE DE ADMISSÃO ATIVO'),
      Abbreviation(
          code: 'ATS',
          description: 'Air Temperature Sensor',
          translation: 'SENSOR DE TEMPERATURA DO AR'),
      Abbreviation(
          code: 'BAS',
          description: 'Bank Angle Sensor',
          translation: 'SENSOR DE ÂNGULO DO BANCO'),
      Abbreviation(
          code: 'BCM',
          description: 'Body Control Module',
          translation: 'MÓDULO DE CONTROLE CORPORAL'),
      Abbreviation(
          code: 'CAN',
          description: 'Controller Area Network',
          translation: 'REDE DA ÁREA DO CONTROLADOR'),
      Abbreviation(
          code: 'CCM',
          description: 'Cruise Control Module',
          translation: 'MÓDULO DE CONTROLE DE CRUZEIRO'),
      Abbreviation(
          code: 'CKP',
          description: 'Crank Position Sensor',
          translation: 'SENSOR DE POSIÇÃO DE MANIVELA'),
      Abbreviation(
          code: 'DLC',
          description: 'Datalink Connector',
          translation: 'CONECTOR DATALINK'),
      Abbreviation(
          code: 'DTC',
          description: 'Diagnostic Trouble Codes',
          translation: 'CÓDIGOS DE PROBLEMAS DE DIAGNÓSTICO'),
      Abbreviation(
          code: 'ECM',
          description: 'Electronic Control Module',
          translation: 'MÓDULO DE CONTROLE ELETRÔNICO'),
      Abbreviation(
          code: 'ECT',
          description: 'Engine Coolant Temperature',
          translation: 'TEMPERATURA DO LÍQUIDO DE ARREFECIMENTO DO MOTOR'),
      Abbreviation(
          code: 'ECU',
          description: 'Electronic Control Unit',
          translation: 'UNIDADE DE CONTROLE ELETRÔNICO'),
      Abbreviation(
          code: 'EFI',
          description: 'Electronic Fuel Injection',
          translation: 'INJEÇÃO ELETRÔNICA DE COMBUSTÍVEL'),
      Abbreviation(
          code: 'EFP',
          description: 'Electronic Fuel Pump',
          translation: 'BOMBA DE COMBUSTÍVEL ELETRÔNICA'),
      Abbreviation(
          code: 'ET',
          description: 'Engine Temperature Sensor',
          translation: 'SENSOR DE TEMPERATURA DO MOTOR'),
      Abbreviation(
          code: 'FI',
          description: 'Fuel Injectors',
          translation: 'INJETORES DE COMBUSTÍVEL'),
      Abbreviation(
          code: 'FPR',
          description: 'Fuel Pressure regulator',
          translation: 'REGULADOR DE PRESSÃO DE COMBUSTÍVEL'),
      Abbreviation(
          code: 'H-DSSS',
          description: 'Harley-Davidson Smart Security System',
          translation: 'SISTEMA DE SEGURANÇA INTELIGENTE HARLEY-DAVIDSON'),
      Abbreviation(
          code: 'HCU',
          description: 'Hydraulic Control Unit, ABS',
          translation: 'UNIDADE DE CONTROLE HIDRÁULICA, ABS'),
      Abbreviation(
          code: 'HFSM',
          description: 'Hands Free Security Module',
          translation: 'MÓDULO DE SEGURANÇA MÃOS LIVRES'),
      Abbreviation(
          code: 'HO2S',
          description: 'Heated Oxygen Sensor',
          translation: 'SENSOR DE OXIGÊNIO AQUECIDO'),
      Abbreviation(
          code: 'IAC',
          description: 'Idle Air Control actuator',
          translation: 'ATUADOR DE CONTROLE DE AR OCIOSO'),
      Abbreviation(
          code: 'IAT',
          description: 'Intake Air Temperature sensor',
          translation: 'SENSOR DE TEMPERATURA DO AR DE ADMISSÃO'),
      Abbreviation(
          code: 'ICM',
          description: 'Ignition Control Module',
          translation: 'MÓDULO DE CONTROLE DE IGNIÇÃO'),
      Abbreviation(
          code: 'IMAP',
          description: 'MAP + IAT in one unit',
          translation: 'MAP + IAT EM UMA UNIDADE'),
      Abbreviation(
          code: 'ISS',
          description: 'Ion Sensing System',
          translation: 'SISTEMA ION SENSING'),
      Abbreviation(
          code: 'JSS',
          description: 'Jiffy Stand Sensor',
          translation: 'SENSOR DE SUPORTE DO PEZINHO'),
      Abbreviation(
          code: 'LHCM',
          description: 'Left Hand Control Module',
          translation: 'MÓDULO DE CONTROLE DA MÃO ESQUERDA'),
      Abbreviation(
          code: 'MAP',
          description: 'Manifold Absolute Pressure Sensor',
          translation: 'SENSOR DE PRESSÃO ABSOLUTA DO MANIFOLD'),
      Abbreviation(
          code: 'MHR',
          description: 'Right Hand Control Module',
          translation: 'MÓDULO DE CONTROLE DA MÃO DIREITA'),
      Abbreviation(
          code: 'RCM',
          description: 'Reverse Control Module',
          translation: 'MÓDULO DE CONTROLE REVERSO'),
      Abbreviation(
          code: 'TCA',
          description: 'Throttle Control Actuato',
          translation: 'ATUADOR DE CONTROLE DE ACELERAÇÃO'),
      Abbreviation(
          code: 'TGS',
          description: 'Twist Grip Sensor',
          translation: 'SENSOR TWIST GRIP'),
      Abbreviation(
          code: 'TMAP',
          description: 'Intake Air Temperature/Manifold Absolute Pressure equipment',
          translation: 'EQUIPAMENTO DE PRESSÃO ABSOLUTA DO AR DE ADMISSÃO'),
      Abbreviation(
          code: 'TPS',
          description: 'Throttle Position Sensor',
          translation: 'SENSOR DE POSIÇÃO DO ACELERADOR'),
      Abbreviation(
          code: 'TSM/TSSM',
          description: 'Turn Signal/Turn Signal Security Module',
          translation: 'SETA/MÓDULO DE SEGURANÇA DE SINALIZAÇÃO (TRIANGULO)'),
      Abbreviation(
          code: 'VE',
          description: 'Volume Efficiency',
          translation: 'EFICIÊNCIA DE VOLUME'),
      Abbreviation(
          code: 'VIN',
          description: 'Vehicle identification number',
          translation: 'NÚMERO DE IDENTIFICAÇÃO DO VEÍCULO (CHASSI)'),
      Abbreviation(
          code: 'VSS',
          description: 'Vehicle Speed Sensor',
          translation: 'SENSOR DE VELOCIDADE DO VEÍCULO'),
      Abbreviation(
          code: 'WSS',
          description: 'Wheel Speed Sensor',
          translation: 'SENSOR DE VELOCIDADE DA RODA'),
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
