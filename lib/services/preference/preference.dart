import 'package:sample_riverpod/index.dart';

class Preference {
  SharedPreferences _preferences;

  Future<SharedPreferences> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }
}