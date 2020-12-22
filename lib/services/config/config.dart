import 'package:sample_riverpod/index.dart';

class ConfigValue<T> {
  final String key;
  Type type;
  final T defaultValue;

  ConfigValue({
    @required this.key,
    @required T type,
    @required this.defaultValue,
  }) {
    this.type = type as Type;
  }
}

class Config {
  Map<String, dynamic> get defaultValues {
    final defaultParameter = configs.map((key, value) {
      return MapEntry<String, dynamic>(
        value.key,
        value.defaultValue,
      );
    });
    return defaultParameter;
  }

  Future<RemoteConfig> getInstance() async {
    final defaultValues = configs.map((key, value) {
      return MapEntry<String, dynamic>(
        value.key,
        value.defaultValue,
      );
    });
    const expirationDuration = Duration(seconds: 5 * 60 * 60 * 5);
    final config = await RemoteConfig.instance;
    await config.setDefaults(defaultValues);
    await config.fetch(expiration: expirationDuration);
    await config.activateFetched();
    return config;
  }

  final configs = {
    CigaretteType.frontierLight: ConfigValue(
      type: String,
      key: 'frontierLight',
      defaultValue: json.encode(
        {
          'nicotine': 0.484,
          'tar': 6.65,
          'ammonia': 11.2,
        },
      ),
    ),
    CigaretteType.marlboroMentholLight: ConfigValue(
      type: String,
      key: 'marlboroMentholLight',
      defaultValue: json.encode(
        {
          'nicotine': 1.41,
          'tar': 19.6,
          'ammonia': 30.7,
        },
      ),
    ),
    CigaretteType.cabinMild: ConfigValue(
      type: String,
      key: 'cabinMild',
      defaultValue: json.encode(
        {
          'nicotine': 1.43,
          'tar': 19.9,
          'ammonia': 28.3,
        },
      ),
    ),
    CigaretteType.mildSeven: ConfigValue(
      type: String,
      key: 'mildSeven',
      defaultValue: json.encode(
        {
          'nicotine': 1.97,
          'tar': 25.1,
          'ammonia': 31.3,
        },
      ),
    ),
    CigaretteType.sevenStar: ConfigValue(
      type: String,
      key: 'sevenStar',
      defaultValue: json.encode(
        {
          'nicotine': 2.66,
          'tar': 31.5,
          'ammonia': 33.9,
        },
      ),
    ),
  };
}
