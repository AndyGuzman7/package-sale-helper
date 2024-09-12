import 'dart:convert';

import 'package:crypto/crypto.dart';

class CufeMethods {
  String getCUFE(List<String> cufeInformation) {
    final concatenated = cufeInformation.join();
    final bytes = utf8.encode(concatenated);
    final digest = sha384.convert(bytes);
    return digest.toString();
  }

  String modulo11(List<String> values) {
    var nPivot = 2;
    var nSumaTotal = 0;
    String sValorExtraido;
    int nMultiplicacionValor;
    int nModulo;

    final concatenated = values.join();
    final resReverse = concatenated.split('').reversed.join();

    var nPosicion = 1;
    while (nPosicion <= resReverse.length) {
      if (nPivot == 8) {
        nPivot = 2;
      }

      sValorExtraido = resReverse.substring(nPosicion - 1, nPosicion);
      nMultiplicacionValor = int.parse(sValorExtraido) * nPivot;
      nSumaTotal += nMultiplicacionValor;
      nPivot += 1;
      nPosicion += 1;
    }

    nModulo = nSumaTotal % 11;
    nModulo = 11 - nModulo;

    if (nModulo == 11) {
      nModulo = 0;
    }

    if (nModulo == 10) {
      nModulo = 1;
    }

    return '$concatenated$nModulo';
  }
}
