import 'package:flutter_test/flutter_test.dart';
import 'package:sale_helper_zencillo/sale_helper_zencillo.dart';

void main() {
  test('Cufe generate', () {
    const subTotal = 16807;
    const taxTotal = 3193;
    const total = 20000;

    final cufe = GenerateCufeCude().generateCufeCude(
      'SETP990000011',
      subTotal.toStringAsFixed(2),
      taxTotal.toStringAsFixed(2),
      total.toStringAsFixed(2),
      '900893296',
      '222222222222',
      'fc8eac422eba16e22ffd8c6f94b3f40a6e38162c',
      '0',
      null,
      dateRegister: '2024-09-2320:43:10-05:00',
    );

    expect(
      cufe,
      '24cbc637a5bbb24b43269fce26ccfa572bfb2a8a4ffa9a3c03761905b84628fddd837f634b52b1f09de614c49ea328da',
    );
  });
}
