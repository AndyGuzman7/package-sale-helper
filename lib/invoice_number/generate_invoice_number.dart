//import 'package:sale_helper_zencillo/invoice_number/invoice_number_methods.dart';
import 'package:sale_helper_zencillo/models/resolution.dart';

class GenerateInvoiceNumber {
  /*static ResultInvoiceNumber generateInvoiceNumber(
    Resolution resolution,
    int lastInvoiceNumber,
  ) {
    final invoiceNumber = InvoiceNumberMethods.getInvoiceNumber(
      lastInvoiceNumber,
      int.parse(resolution.lastNumber),
      int.parse(resolution.finalNumber),
      int.parse(resolution.initialNumber),
    );
    return ResultInvoiceNumber(
      invoiceNumber: invoiceNumber,
      resolution: resolution,
    );
  }*/

  static Future<(int, Resolution)> getInvoiceNumber(
    String voucherCode,
    String lastInvoiceNumber,
    Resolution resolution,
  ) async {
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

  static Future<int> getInvoiceNumberEcuador(
    String lastInvoiceNumber,
    int currentSequence,
  ) async {
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
