import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefProvider = FutureProvider<SharedPreferences>((ref) async {
  final pref = await SharedPreferences.getInstance();
  return pref;
});
