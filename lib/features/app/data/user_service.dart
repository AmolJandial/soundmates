import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soundmates/constants/constants.dart';
import 'package:soundmates/domain/app_user.dart';
import 'package:soundmates/enums/http_code.dart';
import 'package:soundmates/exceptions/user_exceptions.dart';
import 'package:soundmates/extensions/string_extenstions.dart';
import 'package:soundmates/providers/pref_provider.dart';
import 'package:soundmates/utils/dimens.dart';

final userServiceProvider = Provider<UserService>((ref) {
  final prefs = ref.read(prefProvider).requireValue;
  return UserService(preferences: prefs);
});

class UserService {
  final SharedPreferences _preferences;

  const UserService({required SharedPreferences preferences}) : _preferences = preferences;

  Future<AppUser> getUser() async {
    final accessToken = _getAccessToken();
    if (accessToken.isNullOrEmpty) {
      throw UserExceptions.noAccessToken();
    }

    ///todo: user has accessToken, send get request at api/user
    final user = await Future.delayed(Dimens.shortDuration, () => AppUser.dummy());
    final statusCode = HttpCode.success;

    ///todo: if status code = 401, unauthorized. Else return user
    if (statusCode == HttpCode.unauthotized) {
      throw UserExceptions.unauthorized();
    }
    return user;
  }

  String? _getAccessToken() {
    return _preferences.getString(Constants.accessTokenKey);
  }
}
