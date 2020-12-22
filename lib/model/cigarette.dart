import 'package:sample_riverpod/index.dart';

enum CigaretteType {
  frontierLight,
  marlboroMentholLight,
  cabinMild,
  mildSeven,
  sevenStar
}

CigaretteType getCigaretteType(String data) {
  switch (data) {
    case 'frontierLight':
      return CigaretteType.frontierLight;
    case 'marlboroMentholLight':
      return CigaretteType.marlboroMentholLight;
    case 'cabinMild':
      return CigaretteType.cabinMild;
    case 'mildSeven':
      return CigaretteType.mildSeven;
    case 'sevenStar':
      return CigaretteType.sevenStar;
  }
}
