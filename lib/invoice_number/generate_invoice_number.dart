import 'package:sale_helper_zencillo/models/resolution.dart';

class GenerateInvoiceNumber {
  static (int, Resolution) getInvoiceNumber(
    String voucherCode,
    String lastInvoiceNumber,
    Resolution resolution,
  ) {
    var invoiceNumber = 0;

    var lastNumber = int.parse(lastInvoiceNumber);
    if (lastNumber == 0) lastNumber = int.parse(resolution.lastNumber);

    final resolutionInvoiceNumber = int.parse(resolution.lastNumber);
    final lastNumberIsGreater = lastNumber >= resolutionInvoiceNumber;
    final finalNumber = int.parse(resolution.finalNumber);
    if (lastNumber >= finalNumber) {
      throw 'El numero final calculado supera el numero final de la resolución: $finalNumber';
    }
    if (lastNumberIsGreater) invoiceNumber = lastNumber + 1;
    if (!lastNumberIsGreater) invoiceNumber = resolutionInvoiceNumber + 1;
    if (lastNumber == 0) invoiceNumber = int.parse(resolution.initialNumber);
    return (
      invoiceNumber,
      resolution,
    );
  }

  static int getInvoiceNumberResolution(
    String lastInvoiceNumber,
    String resolutionLastNumber,
    String resolutionFinalNumber,
    String resolutionInitialNumber,
  ) {
    var invoiceNumber = 0;

    var lastNumber = int.parse(lastInvoiceNumber);
    if (lastNumber == 0) lastNumber = int.parse(resolutionLastNumber);

    final resolutionInvoiceNumber = int.parse(resolutionLastNumber);
    final lastNumberIsGreater = lastNumber >= resolutionInvoiceNumber;
    final finalNumber = int.parse(resolutionFinalNumber);
    if (lastNumber >= finalNumber) {
      throw 'El numero final calculado supera el numero final de la resolución: $finalNumber';
    }
    if (lastNumberIsGreater) invoiceNumber = lastNumber + 1;
    if (!lastNumberIsGreater) invoiceNumber = resolutionInvoiceNumber + 1;
    if (lastNumber == 0) invoiceNumber = int.parse(resolutionInitialNumber);
    return invoiceNumber;
  }

  static int getInvoiceNumberEcuador(
    String lastInvoiceNumber,
    int currentSequence,
  ) {
    final justNumbers = lastInvoiceNumber.replaceAll(RegExp('[^0-9]'), '');
    final lastNumber = int.parse(justNumbers);
    var invoiceNumber = 0;
    final lastNumberIsGreater = lastNumber >= currentSequence;
    if (lastNumberIsGreater) {
      invoiceNumber = lastNumber + 1;
    } else {
      invoiceNumber = currentSequence;
    }
    return invoiceNumber;
  }
}

class ResultInvoiceNumber {
  final int invoiceNumber;
  final Resolution resolution;

  ResultInvoiceNumber({
    required this.invoiceNumber,
    required this.resolution,
  });
}
