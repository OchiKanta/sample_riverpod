import 'package:sample_riverpod/data_source/intake_substance_data_source.dart';
import 'package:sample_riverpod/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_riverpod/provider/preference_provider.dart';

final intakeSubstanceDataSourceProvider = Provider<IntakeSubstanceDataSource>(
  (ref) => IntakeSubstanceDataSourceImpl(
    ref.read(preferenceProvider),
    ref.read(configProvider),
  ),
);
