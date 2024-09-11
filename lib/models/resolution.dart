import 'package:equatable/equatable.dart';

class Resolution extends Equatable {
  const Resolution({
    required this.idResolution,
    required this.initialNumber,
    required this.finalNumber,
    required this.assignedDate,
    required this.resolutionNumber,
    required this.prefix,
    required this.expirationDate,
    required this.lastNumber,
    required this.type,
    required this.code,
    required this.password,
    required this.idDocumentType,
    required this.state,
  });

  final int idResolution;
  final String initialNumber;
  final String finalNumber;
  final DateTime assignedDate;
  final String resolutionNumber;
  final String prefix;
  final DateTime expirationDate;
  final String lastNumber;
  final String type;
  final String code;
  final String password;
  final int? idDocumentType;
  final bool state;

  // Método copyWith
  Resolution copyWith({
    int? idResolution,
    String? initialNumber,
    String? finalNumber,
    DateTime? assignedDate,
    String? resolutionNumber,
    String? prefix,
    DateTime? expirationDate,
    String? lastNumber,
    String? type,
    String? code,
    String? password,
    int? idDocumentType,
    bool? state,
  }) {
    return Resolution(
      idResolution: idResolution ?? this.idResolution,
      initialNumber: initialNumber ?? this.initialNumber,
      finalNumber: finalNumber ?? this.finalNumber,
      assignedDate: assignedDate ?? this.assignedDate,
      resolutionNumber: resolutionNumber ?? this.resolutionNumber,
      prefix: prefix ?? this.prefix,
      expirationDate: expirationDate ?? this.expirationDate,
      lastNumber: lastNumber ?? this.lastNumber,
      type: type ?? this.type,
      code: code ?? this.code,
      password: password ?? this.password,
      idDocumentType: idDocumentType ?? this.idDocumentType,
      state: state ?? this.state,
    );
  }

  factory Resolution.toEmpty() {
    return Resolution(
      idResolution: 0,
      initialNumber: '',
      finalNumber: '',
      assignedDate: DateTime(1970, 1, 1),
      resolutionNumber: '',
      prefix: '',
      expirationDate: DateTime(1970, 1, 1),
      lastNumber: '',
      type: '',
      code: '',
      password: '',
      idDocumentType: null,
      state: false,
    );
  }

  // Equatable
  @override
  List<Object?> get props => [
        idResolution,
        initialNumber,
        finalNumber,
        assignedDate,
        resolutionNumber,
        prefix,
        expirationDate,
        lastNumber,
        type,
        code,
        password,
        idDocumentType,
        state,
      ];
}
