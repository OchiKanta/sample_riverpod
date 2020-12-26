import 'package:sample_riverpod/index.dart';

class CigaretteList extends StatelessWidget {
  CigaretteList({
    Key key,
    @required this.onTapItem,
  }) : super(key: key);

  final Function onTapItem;

  final List<CigaretteType> cigarettes = [
    CigaretteType.frontierLight,
    CigaretteType.marlboroMentholLight,
    CigaretteType.cabinMild,
    CigaretteType.sevenStar,
    CigaretteType.mildSeven,
  ];

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16.0),
        itemCount: cigarettes.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildListItem(cigarettes[index]);
        },
      ),
    );
  }

  Widget _buildListItem(CigaretteType type) {
    return GestureDetector(
      onTap: () => onTapItem(type),
      child: Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImageItem(type),
            SizedBox(height: 8.0),
            _buildTextItem(type),
          ],
        ),
      ),
    );
  }

  _buildImageItem(CigaretteType type) {
    switch (type) {
      case CigaretteType.frontierLight:
        return Assets.images.frontierLightIcon.image(
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        );
      case CigaretteType.marlboroMentholLight:
        return Assets.images.marlboroMentholLightIcon.image(
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        );
      case CigaretteType.mildSeven:
        return Assets.images.mildSevenIcon.image(
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        );
      case CigaretteType.cabinMild:
        return Assets.images.cabinMildIcon.image(
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        );
      case CigaretteType.sevenStar:
        return Assets.images.sevenStarIcon.image(
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        );
      default:
        break;
    }
  }

  _buildTextItem(CigaretteType type) {
    switch (type) {
      case CigaretteType.frontierLight:
        return Text(
          'frontierLight',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        );
      case CigaretteType.marlboroMentholLight:
        return Text(
          'marlboroMentholLight',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        );
      case CigaretteType.mildSeven:
        return Text(
          'mildSeven',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        );
      case CigaretteType.cabinMild:
        return Text(
          'cabinMild',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        );
      case CigaretteType.sevenStar:
        return Text(
          'sevenStar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        );
      default:
        break;
    }
  }
}
