import 'package:hooks_riverpod/all.dart';
import 'package:sample_riverpod/index.dart';

enum CigaretteType {
  frontierLight,
  marlboroMentholLight,
  cabinMild,
  mildSeven,
  sevenStar
}

final homeScreenNotificationProvider = ChangeNotifierProvider((ref) =>
    HomeScreenViewModel(
        dataSource: ref.read(intakeSubstanceDataSourceProvider)));

class HomeScreenViewModel extends ChangeNotifier {
  HomeScreenViewModel({
    @required IntakeSubstanceDataSource dataSource,
  }) : _dataSource = dataSource;

  final IntakeSubstanceDataSource _dataSource;

  CigaretteType _cigaretteType;
  IntakeSubstance _intakeSubstance;

  CigaretteType get cigaretteName => _cigaretteType;
  IntakeSubstance get intakeSubstance => _intakeSubstance;

  Future<void> firstLoadIntakeSubstance() async {
    final currentCigarette = await _dataSource.loadCurrentCigarette();
    final intakeSubstance =
        await _dataSource.loadIntakeSubstance(currentCigarette);
    _cigaretteType = currentCigarette;
    _intakeSubstance = intakeSubstance;
    notifyListeners();
  }

  Future<void> tapCigaretteListItem(CigaretteType cigaretteType) async {
    await _dataSource.saveCurrentCigarette(cigaretteType);
    final intakeSubstance =
        await _dataSource.loadIntakeSubstance(cigaretteType);
    _cigaretteType = cigaretteType;
    _intakeSubstance = intakeSubstance;
    notifyListeners();
  }

  Future<void> tapSmokeButton() async {
    final newIntakeSubstance = await calculateIntakeSubstance();
    _intakeSubstance = newIntakeSubstance;
    await _dataSource.saveIntakeSubstance(_cigaretteType, _intakeSubstance);
    notifyListeners();
  }

  Future<IntakeSubstance> calculateIntakeSubstance() async {
    final intakeSubstancePerOnce =
        await _dataSource.loadIntakeSubstancePerOnce(_cigaretteType);
    return IntakeSubstance(
      nicotine: (_intakeSubstance.nicotine + intakeSubstancePerOnce.nicotine),
      tar: (_intakeSubstance.tar + intakeSubstancePerOnce.tar),
      ammonia: (_intakeSubstance.ammonia + intakeSubstancePerOnce.ammonia),
    );
  }
}
