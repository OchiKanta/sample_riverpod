import 'package:sample_riverpod/gen/assets.gen.dart';
import 'package:sample_riverpod/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample RiverPod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: HookBuilder(
                builder: (context) {
                  final homeViewModel =
                      useProvider(homeScreenNotificationProvider);
                  final snapshot = useFuture(
                    useMemoized(
                      () => homeViewModel.firstLoadIntakeSubstance(),
                      [homeViewModel.cigaretteName, 'a'],
                    ),
                  );
                  return snapshot.connectionState == ConnectionState.waiting
                      ? SizedBox()
                      : Column(
                          children: [
                            Text(
                              'nicotine: ${homeViewModel.intakeSubstance?.nicotine?.toStringAsFixed(1) ?? ''}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'tar: ${homeViewModel.intakeSubstance?.tar?.toStringAsFixed(1) ?? ''}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'ammonia: ${homeViewModel.intakeSubstance?.ammonia?.toStringAsFixed(1) ?? ''}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
            SizedBox(height: 72.0),
            SizedBox(
              height: 100,
              width: 100,
              child: RaisedButton(
                child: Assets.images.whiteSmokingIcon.image(
                  height: 45.0,
                  width: 45.0,
                  fit: BoxFit.contain,
                ),
                color: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                onPressed: () => context
                    .read(homeScreenNotificationProvider)
                    .tapSmokeButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
