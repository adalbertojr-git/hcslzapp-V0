class DtcCodeAbbreviation {
  String code;
  String description;
  String translation;

  DtcCodeAbbreviation({this.code, this.description, this.translation});

  get load {
    List<DtcCodeAbbreviation> list = [
     DtcCodeAbbreviation(
          code: 'ABS',
          description: 'Anti-Lock Braking System',
          translation: 'Sistema De Freio Anti-Bloqueio'),
     DtcCodeAbbreviation(
          code: 'ACR',
          description: 'Automatic Compression Release',
          translation: 'Liberação Automática de Compressão'),
     DtcCodeAbbreviation(
          code: 'AFR',
          description: 'Air Fuel Ratio',
          translation: 'Taxa De Combustível do Ar'),
     DtcCodeAbbreviation(
          code: 'AIS',
          description: 'Active Intake Solenoid',
          translation: 'Solenoide de Admissão Ativo'),
     DtcCodeAbbreviation(
          code: 'ATS',
          description: 'Air Temperature Sensor',
          translation: 'Sensor de Temperatura do Ar'),
     DtcCodeAbbreviation(
          code: 'BAS',
          description: 'Bank Angle Sensor',
          translation: 'Sensor de Ângulo do Banco'),
     DtcCodeAbbreviation(
          code: 'BCM',
          description: 'Body Control Module',
          translation: 'Módulo de Controle Corporal'),
     DtcCodeAbbreviation(
          code: 'CAN',
          description: 'Controller Area Network',
          translation: 'Rede da Área do Controlador'),
     DtcCodeAbbreviation(
          code: 'CCM',
          description: 'Cruise Control Module',
          translation: 'Módulo de Controle de Cruzeiro'),
     DtcCodeAbbreviation(
          code: 'CKP',
          description: 'Crank Position Sensor',
          translation: 'Sensor de Posição de Manivela'),
     DtcCodeAbbreviation(
          code: 'DLC',
          description: 'Datalink Connector',
          translation: 'Conector Datalink'),
     DtcCodeAbbreviation(
          code: 'DTC',
          description: 'Diagnostic Trouble Codes',
          translation: 'Códigos de Diagnóstico de Problemas'),
     DtcCodeAbbreviation(
          code: 'ECM',
          description: 'Electronic Control Module',
          translation: 'Módulo de Controle Eletrônico'),
     DtcCodeAbbreviation(
          code: 'ECT',
          description: 'Engine Coolant Temperature',
          translation: 'Temperatura do Líquido de Arrefecimento do Motor'),
     DtcCodeAbbreviation(
          code: 'ECU',
          description: 'Electronic Control Unit',
          translation: 'Unidade de Controle Eletrônico'),
     DtcCodeAbbreviation(
          code: 'EFI',
          description: 'Electronic Fuel Injection',
          translation: 'Injeção Eletrônica de Combustível'),
     DtcCodeAbbreviation(
          code: 'EFP',
          description: 'Electronic Fuel Pump',
          translation: 'Bomba Eletrônica de Combustível'),
     DtcCodeAbbreviation(
          code: 'ET',
          description: 'Engine Temperature Sensor',
          translation: 'Sensor de Temperatura do Motor'),
     DtcCodeAbbreviation(
          code: 'FI',
          description: 'Fuel Injectors',
          translation: 'Injetores de Combustível'),
     DtcCodeAbbreviation(
          code: 'FPR',
          description: 'Fuel Pressure regulator',
          translation: 'Regulador de Pressão de Combustível'),
     DtcCodeAbbreviation(
          code: 'H-DSSS',
          description: 'Harley-Davidson Smart Security System',
          translation: 'Sistema de Segurança Inteligente Harley-Davidson'),
     DtcCodeAbbreviation(
          code: 'HCU',
          description: 'Hydraulic Control Unit, ABS',
          translation: 'Unidade de Controle Hidráulica, ABS'),
     DtcCodeAbbreviation(
          code: 'HFSM',
          description: 'Hands Free Security Module',
          translation: 'Módulo de Segurança Mãos Livres'),
     DtcCodeAbbreviation(
          code: 'HO2S',
          description: 'Heated Oxygen Sensor',
          translation: 'Sensor de Oxigênio Aquecido'),
     DtcCodeAbbreviation(
          code: 'IAC',
          description: 'Idle Air Control actuator',
          translation: 'Atuador de Controle de Ar Ocioso'),
     DtcCodeAbbreviation(
          code: 'IAT',
          description: 'Intake Air Temperature sensor',
          translation: 'Sensor de Temperatura do Ar de Admissão'),
     DtcCodeAbbreviation(
          code: 'ICM',
          description: 'Ignition Control Module',
          translation: 'Módulo de Controle de Ignição'),
     DtcCodeAbbreviation(
          code: 'IMAP',
          description: 'MAP + IAT in one unit',
          translation: 'MAP + IAT em uma Unidade'),
     DtcCodeAbbreviation(
          code: 'ISS',
          description: 'Ion Sensing System',
          translation: 'Sistema Ion Sensing'),
     DtcCodeAbbreviation(
          code: 'JSS',
          description: 'Jiffy Stand Sensor',
          translation: 'Sensor de Suporte do Pezinho'),
     DtcCodeAbbreviation(
          code: 'LHCM',
          description: 'Left Hand Control Module',
          translation: 'Módulo de Controle da Mão Esquerda'),
     DtcCodeAbbreviation(
          code: 'MAP',
          description: 'Manifold Absolute Pressure Sensor',
          translation: 'Sensor de Pressão Absoluta do Manifold'),
     DtcCodeAbbreviation(
          code: 'MHR',
          description: 'Right Hand Control Module',
          translation: 'Módulo de Controle da Mão Direita'),
     DtcCodeAbbreviation(
          code: 'RCM',
          description: 'Reverse Control Module',
          translation: 'Módulo de Controle Reverso'),
     DtcCodeAbbreviation(
          code: 'TCA',
          description: 'Throttle Control Actuato',
          translation: 'Atuador de Controle de Aceleração'),
     DtcCodeAbbreviation(
          code: 'TGS',
          description: 'Twist Grip Sensor',
          translation: 'Sensor Twist Grip'),
     DtcCodeAbbreviation(
          code: 'TMAP',
          description: 'Intake Air Temperature/Manifold Absolute Pressure equipment',
          translation: 'Equipamento de Pressão Absoluta do Ar de Admissão'),
     DtcCodeAbbreviation(
          code: 'TPS',
          description: 'Throttle Position Sensor',
          translation: 'Sensor de Posição do Acelerador'),
     DtcCodeAbbreviation(
          code: 'TSM/TSSM',
          description: 'Turn Signal/Turn Signal Security Module',
          translation: 'Seta/Módulo se Segurança De Sinalização (Triângulo)'),
     DtcCodeAbbreviation(
          code: 'VE',
          description: 'Volume Efficiency',
          translation: 'Eficiência de Volume'),
     DtcCodeAbbreviation(
          code: 'VIN',
          description: 'Vehicle identification number',
          translation: 'Número de Identificação do Veículo (Chassis)'),
     DtcCodeAbbreviation(
          code: 'VSS',
          description: 'Vehicle Speed Sensor',
          translation: 'Sensor de Velocidade do Veículo'),
     DtcCodeAbbreviation(
          code: 'WSS',
          description: 'Wheel Speed Sensor',
          translation: 'Sensor De Velocidade da Roda'),
    ];
    return list;
  }
}
