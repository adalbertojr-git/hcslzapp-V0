class DtcCodeECM {
  String code;
  String description;
  final String group = 'Monitorado pelo ECM';

  DtcCodeECM({this.code, this.description});

  get load {
    List<DtcCodeECM> list = [
      DtcCodeECM(
        code: 'P0031',
        description:
            'SONDA LAMBDA DIANTEIRA HO2S DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0032',
        description:
            'SONDA LAMBDA DIANTEIRA HO2S EM CURTO / COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0051',
        description:
            'SONDA LAMBDA TRASEIRA HO2S DESCONECTADA / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0052',
        description:
            'SONDA LAMBDA TRASEIRA HO2S EM CURTO / COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0072',
        description: 'SENSOR AAT COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0073',
        description: 'SENSOR AAT COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P0106',
        description:
            'SENSOR MAP COM PROBLEMA DE FAIXA DE SAÍDA DE TENSÃO INCORRETA OU '
            'PROBLEMA COM O DESEMPENHO DO MOTOR',
      ),
      DtcCodeECM(
        code: 'P0107',
        description: 'SENSOR MAP DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0108',
        description:
            'SENSOR MAP FALHOU COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P0112',
        description: 'IAT COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0113',
        description: 'TENSÃO IAT DESCONECTADO / COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0117',
        description: 'SENSOR ET COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0118',
        description: 'SENSOR ET COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0120',
        description: 'ERRO DE FAIXA TPS1',
      ),
      DtcCodeECM(
        code: 'P0122',
        description: 'TPS1 COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0123',
        description: 'TPS2 COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P0131',
        description:
            'SENSOR FRONTAL DE OXIGÊNIO COM TENSÃO ABAIXO DO NORMAL / MISTURA POBRE',
      ),
      DtcCodeECM(
        code: 'P0132',
        description:
            'SENSOR DE OXIGÊNIO FRONTAL COM TENSÃO ACIMA DO NORMAL / MISTURA RIC',
      ),
      DtcCodeECM(
        code: 'P0134',
        description: 'SENSOR DE OXIGÊNIO DIANTEIRO INATIVO',
      ),
      DtcCodeECM(
        code: 'P0151',
        description:
            'SENSOR DE OXIGÊNIO TRASEIRO COM TENSÃO ABAIXO DO NORMAL / MISTURA POBRE',
      ),
      DtcCodeECM(
        code: 'P0152',
        description:
            'SENSOR DE OXIGÊNIO TRASEIRO COM TENSÃO ACIMA DO NORMAL / MISTURA RICA',
      ),
      DtcCodeECM(
        code: 'P0154',
        description: 'SENSOR DE OXIGÊNIO TRASEIRO INATIVO',
      ),
      DtcCodeECM(
        code: 'P0220',
        description: 'ERRO DE INTERVALO TPS2',
      ),
      DtcCodeECM(
        code: 'P0222',
        description: 'TPS2 COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P0223',
        description: 'TPS2 COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P0261',
        description:
            'INJETOR FRONTAL DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0262',
        description: 'INJETOR FRONTAL COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0263',
        description:
            'INJETOR TRASEIRO DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0264',
        description: 'INJETOR SUPERIOR COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0265',
        description: 'INJETOR TRASEIRO EM CURTO / COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0371',
        description: 'SENSOR CKP NÚMERO ERRADO DE PULSOS',
      ),
      DtcCodeECM(
        code: 'P0373',
        description: 'SENSOR CKP INTERMITENTE',
      ),
      DtcCodeECM(
        code: 'P0374',
        description: 'ERRO DE SINCRONIZAÇÃO DO SENSOR CKP',
      ),
      DtcCodeECM(
        code: 'P0444',
        description:
            'SOLENOIDE DE SAÍDA DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0445',
        description: 'SOLENOIDE DE SAÍDA COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0501',
        description: 'SENSOR VSS COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0502',
        description: 'SENSOR VSS COM TENSÃO ACIMA DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P0503',
        description: 'VSS FALHOU COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0505',
        description: 'CONTROLE DE VELOCIDADE OCIOSA INSTÁVEL',
      ),
      DtcCodeECM(
        code: 'P0562',
        description: ' BATERIA / TENSÃO ECM BAIXA',
      ),
      DtcCodeECM(
        code: 'P0563',
        description: 'BATERIA / VOLTAGEM ECM ALTA',
      ),
      DtcCodeECM(
        code: 'P0572',
        description: 'INTERRUPTOR DE FREIO PRESSIONADO',
      ),
      DtcCodeECM(
        code: 'P0577',
        description:
            'ENTRADA DE CONTROLE DE CRUZEIRO COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P0603',
        description: 'ERRO DE MEMÓRIA EEPROM DO ECM',
      ),
      DtcCodeECM(
        code: 'P0605',
        description: 'ERRO DE MEMÓRIA FLASH ECM',
      ),
      DtcCodeECM(
        code: 'P0641',
        description: 'SINAL DE REFERÊNCIA DE 5 VOLT (1) FORA DO INTERVALO',
      ),
      DtcCodeECM(
        code: 'P0651',
        description: 'SINAL DE REFERÊNCIA DE 5 VOLT (2) FORA DO INTERVALO',
      ),
      DtcCodeECM(
        code: 'P0691',
        description:
            'SAÍDA DE RELÉ DE VENTILADOR / RESFRIAMENTO BAIXA / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P0692',
        description: 'SAÍDA DE RELÉ DE VENTILADOR / RESFRIAMENTO ALTA',
      ),
      DtcCodeECM(
        code: 'P1001',
        description:
            'BOBINA DE RELÉ DE SISTEMA DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P1002',
        description:
            'BOBINA DE RELÉ DO SISTEMA COM TENSÃO ACIMA DO NORMAL / EM CURTO',
      ),
      DtcCodeECM(
        code: 'P1003',
        description: 'CONTATOS DO RELÉ DO SISTEMA DESCONECTADOS',
      ),
      DtcCodeECM(
        code: 'P1004',
        description: 'RELÉ DO SISTEMA COM OS CONTATOS FECHADOS',
      ),
      DtcCodeECM(
        code: 'P1009',
        description: 'SENSOR DE OXIGÊNIO TRASEIRO INATIVO',
      ),
      DtcCodeECM(
        code: 'P1010',
        description: 'SENHA AUSENTE',
      ),
      DtcCodeECM(
        code: 'P1017',
        description: 'ET INDICA SUPERAQUECIMENTO',
      ),
      DtcCodeECM(
        code: 'P1019',
        description: 'DIFERENÇA ECT (ALTA TEMPERATURA)',
      ),
      DtcCodeECM(
        code: 'P1270',
        description: 'TGS 2 A/D ERRO DE VALIDAÇÃO',
      ),
      DtcCodeECM(
        code: 'P1351',
        description:
            'DRIVER DE BOBINA DE IGNIÇÃO DIANTEIRA DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P1352',
        description:
            'DRIVER DE BOBINA DE IGNIÇÃO DIANTEIRA COM TENSÃO ACIMA DO NORMAL / CURTO',
      ),
      DtcCodeECM(
        code: 'P1353',
        description: 'CILINDRO DIANTEIRO SEM COMBUSTÃO',
      ),
      DtcCodeECM(
        code: 'P1354',
        description:
            'DRIVER DE BOBINA DE IGNIÇÃO TRASEIRA DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P1355',
        description:
            'DRIVER DE BOBINA DE IGNIÇÃO TRASEIRA COM TENSÃO ACIMA DO NORMAL / CURTO',
      ),
      DtcCodeECM(
        code: 'P1356',
        description: 'CILINDRO TRASEIRO SEM COMBUSTÃO',
      ),
      DtcCodeECM(
        code: 'P1357',
        description: 'COMBUSTÃO DO CILINDRO DIANTEIRO INTERMITENTE',
      ),
      DtcCodeECM(
        code: 'P1358',
        description: 'COMBUSTÃO DO CILINDRO TRASEIRO INTERMITENTE',
      ),
      DtcCodeECM(
        code: 'P1475',
        description: 'ERRO DE POSIÇÃO DE ATUAÇÃO DO ESCAPE',
      ),
      DtcCodeECM(
        code: 'P1477',
        description:
            'ATUADOR DE ESCAPE DESCONECTADO / COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P1478',
        description: 'ATUADOR DE ESCAPE EM CURTO / COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P1501',
        description: 'SENSOR DO PESINHO TENSÃO BAIXA',
      ),
      DtcCodeECM(
        code: 'P1502',
        description: 'SENSOR DO PESINHO COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P1510',
        description: 'EFI NO MODO LIMITADO',
      ),
      DtcCodeECM(
        code: 'P1511',
        description: 'MODO DE GERENCIAMENTO DE ENERGIA EFI',
      ),
      DtcCodeECM(
        code: 'P1512',
        description: 'MODO INATIVO FORÇADO EFI',
      ),
      DtcCodeECM(
        code: 'P1514',
        description: 'ETC FALHA NO FLUXO DE AR / ERRO',
      ),
      DtcCodeECM(
        code: 'P1600',
        description:
            'ERRO INTERNO DO PROCESSADOR DO MÓDULO EFI / ERRO WATCHDOG',
      ),
      DtcCodeECM(
        code: 'P1608',
        description: 'PERDA DE BATERIA CONTÍNUA',
      ),
      DtcCodeECM(
        code: 'P1655',
        description: 'SOLENOIDE ACR COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P1656',
        description: 'SOLENOIDE ACR CURTO / COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P1691',
        description:
            'VENTILADOR DE REFRIGERAÇÃO COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P1692',
        description: 'VENTILADOR DE REFRIGERAÇÃO DEIXADO EM CURTO',
      ),
      DtcCodeECM(
        code: 'P1693',
        description:
            'VENTILADOR DE ARREFECIMENTO COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P1694',
        description: 'VENTILADOR DE REFRIGERAÇÃO À DIREITA EM CURTO',
      ),
      DtcCodeECM(
        code: 'P2100',
        description: 'CIRCUITO EFI DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P2101',
        description:
            'DESEMPENHO DO INTERVALO DO CIRCUITO DO EFI (ERRO DE ATUAÇÃO)',
      ),
      DtcCodeECM(
        code: 'P2102',
        description: 'CIRCUITO EFI COM TENSÃO BAIXA',
      ),
      DtcCodeECM(
        code: 'P2103',
        description: 'CIRCUITO EFI COM TENSÃO ALTA',
      ),
      DtcCodeECM(
        code: 'P2105',
        description: 'EFI PARADA FORÇADA DO MOTOR',
      ),
      DtcCodeECM(
        code: 'P2107',
        description: 'FALHA INTERNA DO PROCESSADOR DO MÓDULO EFI',
      ),
      DtcCodeECM(
        code: 'P2119',
        description: 'EFI ERRO NO DESEMPENHO DE ACELERAÇÃO',
      ),
      DtcCodeECM(
        code: 'P2122',
        description: 'TGS1 COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P2123',
        description: 'TGS1 COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P2127',
        description: 'TGS2 COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P2128',
        description: 'TGS2 COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P2135',
        description: 'ERRO DE CORRELAÇÃO TPS',
      ),
      DtcCodeECM(
        code: 'P2138',
        description: 'ERRO DE CORRELAÇÃO TGS (SENSOR DE ADERÊNCIA)',
      ),
      DtcCodeECM(
        code: 'P2176',
        description: 'POSIÇÃO FECHADA DA EFI',
      ),
      DtcCodeECM(
        code: 'P2184',
        description: 'SENSOR ECT COM TENSÃO ABAIXO DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P2185',
        description: 'SENSOR ECT COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P2300',
        description:
            'ACIONADOR DIANTEIRO DA BOBINA DE IGNIÇÃO COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P2301',
        description: 'ACIONADOR DA BOBINA DE IGNIÇÃO EM CURTO / COM TENSÃO ACIMA DO NORMAL',
      ),
      DtcCodeECM(
        code: 'P2303',
        description: 'CONDUTOR TRASEIRO DA BOBINA DE IGNIÇÃO COM TENSÃO ABAIXO DO NORMAL / DESCONECTADO',
      ),
      DtcCodeECM(
        code: 'P2304',
        description: 'ACIONADOR DA BOBINA DE IGNIÇÃO EM CURTO / COM TENSÃO ACIMA DO NORMAL',
      ),
    ];
    return list;
  }
}
