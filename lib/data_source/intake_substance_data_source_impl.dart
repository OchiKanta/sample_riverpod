import 'package:hooks_riverpod/all.dart';
import 'package:sample_riverpod/index.dart';

class IntakeSubstanceDataSourceImpl extends IntakeSubstanceDataSource {
  IntakeSubstanceDataSourceImpl(
    this._preference,
    this._config,
  );

  final Preference _preference;
  final Config _config;

  @override
  Future<CigaretteType> loadCurrentCigarette() async {
    final prefs = await _preference.getInstance();
    final cigaretteName = prefs.getString('currentCigarette') ?? 'frontierLight';
    return getCigaretteType(cigaretteName);
  }

  @override
  Future<IntakeSubstance> loadIntakeSubstance(
    CigaretteType cigaretteType,
  ) async {
    final prefs = await _preference.getInstance();
    return IntakeSubstance.fromJson(prefs.getString(cigaretteType.toString()));
  }

  @override
  Future<void> saveIntakeSubstance(
    CigaretteType cigaretteType,
    IntakeSubstance intakeSubstance,
  ) async {
    final prefs = await _preference.getInstance();
    final intakeSubstanceEncoded = json.encode({
      'nicotine': intakeSubstance.nicotine,
      'tar': intakeSubstance.tar,
      'ammonia': intakeSubstance.ammonia,
    });
    return prefs.setString(cigaretteType.toString(), intakeSubstanceEncoded);
  }

  @override
  Future<void> saveCurrentCigarette(
    CigaretteType cigaretteType,
  ) async {
    final prefs = await _preference.getInstance();
    return prefs.setString(
      'currentCigarette',
      cigaretteType.toString(),
    );
  }

  @override
  Future<IntakeSubstance> loadIntakeSubstancePerOnce(
    CigaretteType cigaretteType,
  ) async {
    final config = await _config.getInstance();
    final configValue = _config.configs[cigaretteType];
    final defaultValue = _config.defaultValues[configValue.key];
    final key = configValue?.key ?? cigaretteType.toString();
    final value = config?.getString(key) ?? defaultValue as String;
    return IntakeSubstance.fromJson(value);
  }
}
