class InvoiceNumberMethods {
  static int getInvoiceNumber(
    int lastInvoiceNumber,
    int resolutionLastNumber,
    int resolutionFinalNumber,
    int resolutionInitialNumber,
  ) {
    var invoiceNumber = 0;

    var lastNumber = lastInvoiceNumber;
    if (lastNumber == 0) lastNumber = resolutionLastNumber;

    final resolutionInvoiceNumber = resolutionLastNumber;
    final lastNumberIsGreater = lastNumber >= resolutionInvoiceNumber;
    final finalNumber = resolutionFinalNumber;
    if (lastNumber >= finalNumber) {
      throw 'El numero final calculado supera el numero final de la resolución: $finalNumber';
    }
    if (lastNumberIsGreater) invoiceNumber = lastNumber + 1;
    if (!lastNumberIsGreater) invoiceNumber = resolutionInvoiceNumber + 1;
    if (lastNumber == 0) invoiceNumber = resolutionInitialNumber;
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
