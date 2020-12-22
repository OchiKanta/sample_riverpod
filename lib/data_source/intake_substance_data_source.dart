import 'package:sample_riverpod/index.dart';

abstract class IntakeSubstanceDataSource {
  Future<CigaretteType> loadCurrentCigarette();
  Future<IntakeSubstance> loadIntakeSubstance(
    CigaretteType cigaretteType,
  );
  Future<void> saveIntakeSubstance(
    CigaretteType cigaretteType,
    IntakeSubstance intakeSubstance,
  );
  Future<void> saveCurrentCigarette(
    CigaretteType cigaretteType,
  );
  Future<IntakeSubstance> loadIntakeSubstancePerOnce(
    CigaretteType cigaretteType,
  );
}
