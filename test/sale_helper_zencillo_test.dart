import 'package:flutter_test/flutter_test.dart';

import 'package:sale_helper_zencillo/sale_helper_zencillo.dart';

void main() {
  test('Cufe generate', () {
    const subTotal = 100;
    const taxTotal = 0;
    const total = 100;

    final cufe = GenerateCufeCude.generateCufeCude(
      'DBBH56',
      subTotal.toStringAsFixed(2),
      taxTotal.toStringAsFixed(2),
      total.toStringAsFixed(2),
      '890930448',
      '1017195510',
      '79a6b41e5e5fa03e8e055ee7dc58cde8930cd6419996b0c971c27215d2e3989f',
      '1',
      null,
      dateRegister: '2024-09-0312:08:01-05:00',
    );
    print(cufe);

    expect(
      cufe,
      '24cbc637a5bbb24b43269fce26ccfa572bfb2a8a4ffa9a3c03761905b84628fddd837f634b52b1f09de614c49ea328da',
    );
  });
}
