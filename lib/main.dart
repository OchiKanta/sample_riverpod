import 'package:sample_riverpod/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  // await Firebase.initializeApp();
  // Riverpodを使う為にラップする必要がある
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample RiverPod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
