class DtcCode {
  String code;
  String description;
  String group;

  DtcCode({this.code, this.description, this.group});

  get loadECMList {
    List<DtcCode> list = [
      DtcCode(
          code: 'P0031',
          description:
              'SONDA LAMBDA DIANTEIRA HO2S DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0032',
          description:
              'SONDA LAMBDA DIANTEIRA HO2S EM CURTO / COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0051',
          description:
              'SONDA LAMBDA TRASEIRA HO2S DESCONECTADA / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0052',
          description:
              'SONDA LAMBDA TRASEIRA HO2S EM CURTO / COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0072',
          description: 'SENSOR AAT COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0073',
          description: 'SENSOR AAT COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0106',
          description:
              'SENSOR MAP COM PROBLEMA DE FAIXA DE SAÍDA DE TENSÃO INCORRETA OU '
              'PROBLEMA COM O DESEMPENHO DO MOTOR',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0107',
          description: 'SENSOR MAP DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0108',
          description:
              'SENSOR MAP FALHOU COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0112',
          description: 'IAT COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0113',
          description: 'TENSÃO IAT DESCONECTADO / COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0117',
          description: 'SENSOR ET COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0118',
          description: 'SENSOR ET COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0120',
          description: 'ERRO DE FAIXA TPS1',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0122',
          description: 'TPS1 COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0123',
          description: 'TPS2 COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0131',
          description:
              'SENSOR FRONTAL DE OXIGÊNIO COM TENSÃO ABAIXO DO NORMAL / MISTURA POBRE',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0132',
          description:
              'SENSOR DE OXIGÊNIO FRONTAL COM TENSÃO ACIMA DO NORMAL / MISTURA RIC',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0134',
          description: 'SENSOR DE OXIGÊNIO DIANTEIRO INATIVO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0151',
          description:
              'SENSOR DE OXIGÊNIO TRASEIRO COM TENSÃO ABAIXO DO NORMAL / MISTURA POBRE',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0152',
          description:
              'SENSOR DE OXIGÊNIO TRASEIRO COM TENSÃO ACIMA DO NORMAL / MISTURA RICA',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0154',
          description: 'SENSOR DE OXIGÊNIO TRASEIRO INATIVO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0220',
          description: 'ERRO DE INTERVALO TPS2',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0222',
          description: 'TPS2 COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0223',
          description: 'TPS2 COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0261',
          description:
              'INJETOR FRONTAL DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0262',
          description: 'INJETOR FRONTAL COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0263',
          description:
              'INJETOR TRASEIRO DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0264',
          description: 'INJETOR SUPERIOR COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0265',
          description: 'INJETOR TRASEIRO EM CURTO / COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0371',
          description: 'SENSOR CKP NÚMERO ERRADO DE PULSOS',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0373',
          description: 'SENSOR CKP INTERMITENTE',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0374',
          description: 'ERRO DE SINCRONIZAÇÃO DO SENSOR CKP',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0444',
          description:
              'SOLENOIDE DE SAÍDA DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0445',
          description: 'SOLENOIDE DE SAÍDA COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0501',
          description: 'SENSOR VSS COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0502',
          description: 'SENSOR VSS COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0503',
          description: 'VSS FALHOU COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0505',
          description: 'CONTROLE DE VELOCIDADE OCIOSA INSTÁVEL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0562',
          description: ' BATERIA / TENSÃO ECM BAIXA',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0563',
          description: 'BATERIA / VOLTAGEM ECM ALTA',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0572',
          description: 'INTERRUPTOR DE FREIO PRESSIONADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0577',
          description:
              'ENTRADA DE CONTROLE DE CRUZEIRO COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0603',
          description: 'ERRO DE MEMÓRIA EEPROM DO ECM',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0605',
          description: 'ERRO DE MEMÓRIA FLASH ECM',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0641',
          description: 'SINAL DE REFERÊNCIA DE 5 VOLT (1) FORA DO INTERVALO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0651',
          description: 'SINAL DE REFERÊNCIA DE 5 VOLT (2) FORA DO INTERVALO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0691',
          description:
              'SAÍDA DE RELÉ DE VENTILADOR / RESFRIAMENTO BAIXA / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P0692',
          description: 'SAÍDA DE RELÉ DE VENTILADOR / RESFRIAMENTO ALTA',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1001',
          description:
              'BOBINA DE RELÉ DE SISTEMA DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1002',
          description:
              'BOBINA DE RELÉ DO SISTEMA COM TENSÃO ACIMA DO NORMAL / EM CURTO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1003',
          description: 'CONTATOS DO RELÉ DO SISTEMA DESCONECTADOS',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1004',
          description: 'RELÉ DO SISTEMA COM OS CONTATOS FECHADOS',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1009',
          description: 'SENSOR DE OXIGÊNIO TRASEIRO INATIVO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1010',
          description: 'SENHA AUSENTE',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1017',
          description: 'ET INDICA SUPERAQUECIMENTO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1019',
          description: 'DIFERENÇA ECT (ALTA TEMPERATURA)',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1270',
          description: 'TGS 2 A/D ERRO DE VALIDAÇÃO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1351',
          description:
              'DRIVER DE BOBINA DE IGNIÇÃO DIANTEIRA DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1352',
          description:
              'DRIVER DE BOBINA DE IGNIÇÃO DIANTEIRA COM TENSÃO ACIMA DO NORMAL / CURTO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1353',
          description: 'CILINDRO DIANTEIRO SEM COMBUSTÃO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1354',
          description:
              'DRIVER DE BOBINA DE IGNIÇÃO TRASEIRA DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1355',
          description:
              'DRIVER DE BOBINA DE IGNIÇÃO TRASEIRA COM TENSÃO ACIMA DO NORMAL / CURTO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1356',
          description: 'CILINDRO TRASEIRO SEM COMBUSTÃO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1357',
          description: 'COMBUSTÃO DO CILINDRO DIANTEIRO INTERMITENTE',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1358',
          description: 'COMBUSTÃO DO CILINDRO TRASEIRO INTERMITENTE',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1475',
          description: 'ERRO DE POSIÇÃO DE ATUAÇÃO DO ESCAPE',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1477',
          description:
              'ATUADOR DE ESCAPE DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1478',
          description:
              'ATUADOR DE ESCAPE EM CURTO / COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1501',
          description: 'SENSOR DO PESINHO TENSÃO BAIXA',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1502',
          description: 'SENSOR DO PESINHO COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1510',
          description: 'EFI NO MODO LIMITADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1511',
          description: 'MODO DE GERENCIAMENTO DE ENERGIA EFI',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1512',
          description: 'MODO INATIVO FORÇADO EFI',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1514',
          description: 'ETC FALHA NO FLUXO DE AR / ERRO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1600',
          description:
              'ERRO INTERNO DO PROCESSADOR DO MÓDULO EFI / ERRO WATCHDOG',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1608',
          description: 'PERDA DE BATERIA CONTÍNUA',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1655',
          description:
              'SOLENOIDE ACR COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1656',
          description: 'SOLENOIDE ACR CURTO / COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1691',
          description:
              'VENTILADOR DE REFRIGERAÇÃO COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1692',
          description: 'VENTILADOR DE REFRIGERAÇÃO DEIXADO EM CURTO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1693',
          description:
              'VENTILADOR DE ARREFECIMENTO COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P1694',
          description: 'VENTILADOR DE REFRIGERAÇÃO À DIREITA EM CURTO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2100',
          description: 'CIRCUITO EFI DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2101',
          description:
              'DESEMPENHO DO INTERVALO DO CIRCUITO DO EFI (ERRO DE ATUAÇÃO)',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2102',
          description: 'CIRCUITO EFI COM TENSÃO BAIXA',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2103',
          description: 'CIRCUITO EFI COM TENSÃO ALTA',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2105',
          description: 'EFI PARADA FORÇADA DO MOTOR',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2107',
          description: 'FALHA INTERNA DO PROCESSADOR DO MÓDULO EFI',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2119',
          description: 'EFI ERRO NO DESEMPENHO DE ACELERAÇÃO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2122',
          description: 'TGS1 COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2123',
          description: 'TGS1 COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2127',
          description: 'TGS2 COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2128',
          description: 'TGS2 COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2135',
          description: 'ERRO DE CORRELAÇÃO TPS',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2138',
          description: 'ERRO DE CORRELAÇÃO TGS (SENSOR DE ADERÊNCIA)',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2176',
          description: 'POSIÇÃO FECHADA DA EFI',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2184',
          description: 'SENSOR ECT COM TENSÃO ABAIXO DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2185',
          description: 'SENSOR ECT COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2300',
          description:
              'ACIONADOR DIANTEIRO DA BOBINA DE IGNIÇÃO COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2301',
          description:
              'ACIONADOR DA BOBINA DE IGNIÇÃO EM CURTO / COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2303',
          description:
              'CONDUTOR TRASEIRO DA BOBINA DE IGNIÇÃO COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
          group: 'Monitorado pela ECM'),
      DtcCode(
          code: 'P2304',
          description:
              'ACIONADOR DA BOBINA DE IGNIÇÃO EM CURTO / COM TENSÃO ACIMA DO NORMAL',
          group: 'Monitorado pela ECM'),
    ];
    return list;
  }

  get loadABSList {
    List<DtcCode> list = [
      DtcCode(code: 'C0562', description: 'BAIXA TENSÃO DO ABS', group: 'ABS'),
      DtcCode(code: 'C0563', description: 'ALTA TENSÃO DO ABS', group: 'ABS'),
      DtcCode(
          code: 'C1014',
          description: 'ERRO DE RELÉ DO ECU DO ABS',
          group: 'ABS'),
      DtcCode(
          code: 'C1021',
          description: 'WSS FRONTAL DO ABS SEMPRE ZERO',
          group: 'ABS'),
      DtcCode(
          code: 'C1023',
          description: 'WSS TRASEIRO ABS SEMPRE ZERO',
          group: 'ABS'),
      DtcCode(
          code: 'C1025',
          description: 'VELOCIDADE DA RODA DIANTEIRA DO ABS INTERMITENTE',
          group: 'ABS'),
      DtcCode(
          code: 'C1027',
          description: 'VELOCIDADE DA RODA TRASEIRA DO ABS INTERMITENTE',
          group: 'ABS'),
      DtcCode(
          code: 'C1029',
          description: 'DIFERENÇA DE VELOCIDADE DA RODA DO ABS MUITO ALTA',
          group: 'ABS'),
      DtcCode(
          code: 'C1032',
          description:
              'CIRCUITO DE VELOCIDADE DA RODA DIANTEIRA ABS DESCONECTADO / EM CURTO',
          group: 'ABS'),
      DtcCode(
          code: 'C1034',
          description:
              'CIRCUITO DE VELOCIDADE DA RODA TRASEIRA DO ABS DESCONECTADO / EM CURTO',
          group: 'ABS'),
      DtcCode(
          code: 'C1040',
          description: 'ERRO DA BOMBA / MOTOR DO ABS',
          group: 'ABS'),
      DtcCode(
          code: 'C1055', description: 'ERRO INTERNO DO ABS ECU', group: 'ABS'),
      DtcCode(
          code: 'C1061',
          description:
              'PARTE FRONTAL DO ABS APLICA CIRCUITO SOLENOIDE DESCONECTADO / ALTA RESISTÊNCIA',
          group: 'ABS'),
      DtcCode(
          code: 'C1062',
          description:
              'CIRCUITO DO SOLENOIDE DE LIBERAÇÃO DIANTEIRA DO ABS DESCONECTADO / ALTA RESISTÊNCIA',
          group: 'ABS'),
      DtcCode(
          code: 'C1065',
          description:
              'A TRASEIRA DO ABS APLICA O CIRCUITO SOLENOIDE DESCONECTADO / ALTA RESISTÊNCIA',
          group: 'ABS'),
      DtcCode(
          code: 'C1066',
          description:
              'CIRCUITO DO SOLENOIDE DE LIBERAÇÃO TRASEIRA DO ABS DESCONECTADO / ALTA RESISTÊNCIA',
          group: 'ABS'),
      DtcCode(
          code: 'C1071',
          description: 'ERRO NA VÁLVULA TRASEIRA PRINCIPAL',
          group: 'ABS'),
      DtcCode(
          code: 'C1072',
          description: 'ERRO DA VÁLVULA DE ISOLAMENTO TRASEIRO',
          group: 'ABS'),
      DtcCode(
          code: 'C1073',
          description: 'ERRO DA VÁLVULA DE ISOLAMENTO FRONTAL',
          group: 'ABS'),
      DtcCode(
          code: 'C1074',
          description: 'ERRO NA VÁLVULA DE FECHAMENTO',
          group: 'ABS'),
      DtcCode(
          code: 'C1075',
          description: 'ERRO DE VÁLVULA DE ENTRADA COM LIGAÇÃO FRONTAL',
          group: 'ABS'),
      DtcCode(
          code: 'C1076',
          description: 'ERRO DA VÁLVULA DE SAÍDA LIGADA NA PARTE FRONTAL',
          group: 'ABS'),
      DtcCode(
          code: 'C1077',
          description: 'ERRO DO SENSOR DE PRESSÃO DO CIRCUITO DIANTEIRO',
          group: 'ABS'),
      DtcCode(
          code: 'C1078',
          description: 'ERRO DO SENSOR DE PRESSÃO DO CIRCUITO TRASEIRO',
          group: 'ABS'),
      DtcCode(
          code: 'C1081',
          description: 'ERRO DO SENSOR DE PRESSÃO DO MESTRE FRONTAL',
          group: 'ABS'),
      DtcCode(
          code: 'C1082',
          description:
              'ERRO DE COMPENSAÇÃO DO SENSOR DE PRESSÃO DO MESTRE FRONTAL',
          group: 'ABS'),
      DtcCode(
          code: 'C1083',
          description: 'ERRO DO SENSOR DE PRESSÃO DA RODA DIANTEIRA',
          group: 'ABS'),
      DtcCode(
          code: 'C1084',
          description:
              'ERRO DE DESLOCAMENTO DO SENSOR DE PRESSÃO DA RODA DIANTEIRA',
          group: 'ABS'),
      DtcCode(
          code: 'C1085',
          description: 'ERRO DO SENSOR DE PRESSÃO MESTRE TRASEIRO',
          group: 'ABS'),
      DtcCode(
          code: 'C1086',
          description:
              'ERRO DO SENSOR DE COMPENSAÇÃO DA PRESSÃO MESTRE TRASEIRA',
          group: 'ABS'),
      DtcCode(
          code: 'C1087',
          description: 'ERRO DO SENSOR DE PRESSÃO DA RODA TRASEIRA',
          group: 'ABS'),
      DtcCode(
          code: 'C1088',
          description:
              'ERRO DE COMPENSAÇÃO DO SENSOR DE PRESSÃO DA RODA TRASEIRA',
          group: 'ABS'),
      DtcCode(
          code: 'C1089',
          description: 'ERRO DE FORNECIMENTO EXTERNO DO SENSOR DE PRESSÃO',
          group: 'ABS'),
      DtcCode(
          code: 'C1159',
          description: 'ERRO DE VIN (NUMERO DO CHASSIS) INVÁLIDO',
          group: 'ABS'),
      DtcCode(
          code: 'C1178',
          description: 'ERRO NO ABS NO VIN (NUMERO DO CHASSI) RECEBIDO DA ECM',
          group: 'ABS'),
      DtcCode(
          code: 'C1184',
          description: 'ABS CÓDIFO INVÁLIDO DO VIN (NUMERO DO CHASSI) NO ECM',
          group: 'ABS'),
      DtcCode(
          code: 'C1195', description: 'ERRO DE INICIALIZAÇÃO', group: 'ABS'),
    ];
    return list;
  }

  get loadBCMList {
    List<DtcCode> list = [
      DtcCode(
          code: 'B0563',
          description: 'ALTA VOLTAGEM DA BATERIA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1103',
          description: 'ERRO INTERNO DO LHCM',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1121',
          description: '(TSM / (HFSM)) FALHA DA SETA ESQUERDA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1122',
          description: '(TSM / (HFSM)) FALHA DA SETA DIREITA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1123',
          description: '(HFSM) SETA À ESQUERDA EM CURTO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1124',
          description: '(HFSM) SETA DIREITA EM CURTO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1125',
          description: '(HFSM) SETA ESQUERDA EM CURTO PARA BATERIA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1126',
          description: '(HFSM) SETA DIREITA EM CURTO PARA BATERIA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1131',
          description: 'SETA (TRIANGULO) (HFSM) COM TENSÃO ABAIXO DO NORMAL',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1132',
          description: 'SETA (TRIANGULO) (HFSM) COM TENSÃO ACIMA DO NORMAL',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1134',
          description: 'SAIDA DE PARTIDA ALTA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1135',
          description: 'FALHA NO ACELERÔMETRO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1136',
          description: 'ERRO DE TESTE DA PONTA DO ACELERÔMETRO (HFSM)',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1141',
          description:
              '(TSM) INTERRUPTOR DE IGNIÇÃO COM BAIXA TENSÃO / DESCONECTADA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1142',
          description: 'FALHA INTERNA DO SMART SECURITY SYSTEM',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1143',
          description: 'ANTENA DE SEGURANÇA – (HFSM) CURTO AO ATERRAMENTO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1144',
          description: 'ANTENA DE SEGURANÇA – (HFSM) CURTO A BATERIA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1145',
          description: 'ANTENA DE SEGURANÇA – (HFSM) DESCONECTADA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1151',
          description: 'SENSOR DE ÂNGULO DO BANCO (BAS) CURTO AO ATERRAMENTO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1152',
          description: 'SENSOR DE ÂNGULO DO BANCO (BAS) CURTO PARA BATERIA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1153',
          description:
              'SENSOR DE ÂNGULO DE BANCO (BAS) COM TENSÃO ACIMA DO NORMAL',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1154',
          description:
              'ENTRADA DO INTERRUPTOR DA EMBREAGEM CURTO NO ATERRAMENTO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1155',
          description: 'ENTRADA DO INTERRUPTOR DE NEUTRO CURTO NA BATERIA',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1200',
          description: 'FALHA INTERNA IM',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1210',
          description:
              'NÍVEL DO COMBUSTÍVEL EM CURTO / COM TENSÃO ABAIXO DO NORMAL',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1211',
          description: 'NÍVEL DO COMBUSTÍVEL EM CURTO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1212',
          description: 'SINAL DE COMBUSTÍVEL COM TENSÃO ABAIXO DO NORMAL',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1213',
          description: 'SINAL DE COMBUSTÍVEL COM TENSÃO ACIMA DO NORMAL',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1300',
          description: 'ALTA TENSÃO NO SISTEMA DE RÁDIO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1301',
          description: 'BAIXA TENSÃO NO SISTEMA DE RÁDIO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1302',
          description: 'BOTÃO HOME DO PAINEL FRONTAL PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1303',
          description: 'BOTÃO FAVORITO DO PAINEL FRONTAL PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1304',
          description: 'BOTÃO DE NAVEGAÇÃO DO PAINEL FRONTAL PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1305',
          description: 'BOTÃO LIGA / DESLIGA DO PAINEL FRONTAL',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1306',
          description: 'CONTROLES DA MÃO CURTO OU COM TENSÃO ACIMA DO NORMAL',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1307',
          description: 'CONTROLES DA MÃO EM CURTO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1308',
          description: 'BOTÃO DE VOLUME PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1309',
          description: 'BOTÃO DE QUEDA DO VOLUME PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1310',
          description: 'BOTÃO DO MODO PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1311',
          description: 'BOTÃO PTT PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1312',
          description: 'BOTÃO DE AJUSTE PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1313',
          description: 'BOTÃO DE SINTONIZAÇÃO PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1314',
          description: 'BOTÃO LHCM VR PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1315',
          description: 'BOTÃO PARA CIMA LHCM PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1316',
          description: 'BOTÃO ESQUERDO DO LHCM PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1317',
          description: 'BOTÃO CENTRAL DO LHCM PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1318',
          description: 'BOTÃO DIREITO DO LHCM PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
      DtcCode(
          code: 'B1319',
          description: 'BOTÃO PARA BAIXO DO LHCM PRESO',
          group: 'Definido por Rádio, Instrumentos e BCM'),
    ];
    return list;
  }
}
