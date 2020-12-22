import 'package:sample_riverpod/index.dart';

class IntakeSubstance {
  final double nicotine;
  final double tar;
  final double ammonia;

  IntakeSubstance({
    this.nicotine,
    this.tar,
    this.ammonia,
  });

  factory IntakeSubstance.fromJson(dynamic data) {
    if (data == null) {
      return IntakeSubstance(
        nicotine: 0,
        tar: 0,
        ammonia: 0,
      );
    }
    final dataDecoded = json.decode(data) as Map<String, dynamic> ?? {};
    return IntakeSubstance(
      nicotine: dataDecoded['nicotine'] as double ?? 0,
      tar: dataDecoded['tar'] as double ?? 0,
      ammonia: dataDecoded['ammonia'] as double ?? 0,
    );
  }
}
