class GenerateDocumentInvoice {
  int getDocumentNumber(int idAutoSale, int lastIdDocument) {
    final lastIdIsGreater = lastIdDocument > idAutoSale;

    var idDocument = 0;

    if (lastIdIsGreater) {
      idDocument = lastIdDocument + 1;
    } else {
      idDocument = idAutoSale + 1;
    }
    return idDocument;
  }
}
