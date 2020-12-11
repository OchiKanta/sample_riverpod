import 'package:sample_riverpod/index.dart';

class IntakeSubstance {
  final Float okooto;
  final Float polia;
  final Float termeri;

  IntakeSubstance({
    this.okooto,
    this.polia,
    this.termeri,
  });

  factory IntakeSubstance.fromJson(dynamic data) {
    final dataDecoded = json.decode(data) as Map<String, dynamic> ?? {};
    return IntakeSubstance(
      okooto: dataDecoded['okooto'] as Float ?? null,
      polia: dataDecoded['polia'] as Float ?? null,
      termeri: dataDecoded['termeri'] as Float ?? null,
    );
  }
}
