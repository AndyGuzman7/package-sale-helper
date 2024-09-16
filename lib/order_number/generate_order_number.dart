class GenerateOrderNumber {
  int getOrderNumber(int idOrder, int lastIdOrder) {
    final lastIdIsGreater = lastIdOrder > idOrder;

    var idDocument = 0;

    if (lastIdIsGreater) {
      idDocument = lastIdOrder + 1;
    } else {
      idDocument = idOrder + 1;
    }
    return idDocument;
  }
}
