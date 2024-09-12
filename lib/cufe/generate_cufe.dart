import 'package:intl/intl.dart';
import 'package:sale_helper_zencillo/cufe/cufe_methods.dart';

class GenerateCufeCude {
  final CufeMethods cufeMethods = CufeMethods();
  String generateCufeCude(
    String invoiceNumber,
    String subTotal,
    String taxTotal,
    String total,
    String companyNit,
    String identification,
    String resolutionPassword,
    String emission,
    DateTime? now, {
    String dateRegister = '',
  }) {
    var formattedDate = dateRegister;

    if (now != null) {
      formattedDate =
          '${DateFormat("yyyy-MM-ddHH:mm:ss").format(now)}${now.timeZoneOffset.isNegative ? '-' : '+'}${now.timeZoneOffset.inHours.abs().toString().padLeft(2, '0')}:${now.timeZoneOffset.inMinutes.remainder(60).toString().padLeft(2, '0')}';
    }
    final cufeInformation = <String>[
      invoiceNumber,
      formattedDate,
      subTotal,
      '01',
      taxTotal,
      '04',
      '0.00',
      '03',
      '0.00',
      total,
      companyNit.replaceAll('-', ''),
      identification.replaceAll('-', ''),
      resolutionPassword,
      if (emission == '0') '2' else emission,
    ];
    final hash = cufeMethods.getCUFE(cufeInformation);
    return hash;
  }

  String generateCufeCudeEcuador(
    String invoiceNumber,
    String companyNit,
    String saleCenterCode,
    String saleSpotCode,
    String typeEnvironment,
  ) {
    final values = <String>[
      DateFormat('ddMMyyyy').format(DateTime.now()),
      '01',
      companyNit,
      // TESTING ENVIRONMENT
      typeEnvironment,
      saleCenterCode,
      saleSpotCode,
      invoiceNumber.padLeft(9, '0'),
      '12345678',
      '1',
    ];
    final ecuadorPassword = cufeMethods.modulo11(values);
    return ecuadorPassword;
  }
}
