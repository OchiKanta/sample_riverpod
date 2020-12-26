import 'package:sample_riverpod/index.dart';

abstract class CigaretteStringHelper {
  static CigaretteType getCigaretteType(String data) {
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

  static String getCigaretteString(CigaretteType data) {
    switch (data) {
      case CigaretteType.frontierLight:
        return 'frontierLight';
      case CigaretteType.marlboroMentholLight:
        return 'marlboroMentholLight';
      case CigaretteType.cabinMild:
        return 'cabinMild';
      case CigaretteType.mildSeven:
        return 'mildSeven';
      case CigaretteType.sevenStar:
        return 'sevenStar';
    }
  }
}
