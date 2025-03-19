import 'package:flutter_test/flutter_test.dart';
import 'package:soundmates/domain/app_user.dart';
import 'package:soundmates/domain/artist.dart';
import 'package:soundmates/domain/user_location.dart';
import 'package:soundmates/enums/gender.dart';

void main() {
  group('app user domain', () {
    late final AppUser user;
    late final Map<String, dynamic> userMap;
    late final UserLocation location;
    late final Map<String, dynamic> locationMap;
    late final List<Artist> artistList;
    late final List<Map<String, dynamic>> artistListMap;

    setUpAll(() {
      artistList = [const Artist(mbid: '123', name: 'name', genres: [], imageUrl: 'imageUrl')];
      artistListMap = [
        {'mbid': '123', 'name': 'name', 'genres': [], 'imageUrl': 'imageUrl'},
      ];
      location = const UserLocation();
      locationMap = {'type': 'Point', 'coordinates': []};

      user = AppUser(
        id: '0',
        phoneNumber: '123',
        name: 'test',
        age: 0,
        description: 'desc',
        gender: Gender.other,
        favoriteArtists: artistList,
        location: location,
      );
      userMap = {
        'id': '0',
        'phoneNumber': '123',
        'name': 'test',
        'age': 0,
        'description': 'desc',
        'gender': 3,
        'favoriteArtists': artistListMap,
        'location': locationMap,
      };
    });

    test('fromMap should return app user when deserialized', () {
      //Arrange

      //act
      final result = AppUser.fromMap(userMap);
      //
      expect(result, isA<AppUser>());
      expect(result, equals(user));
    });

    test('toMap should return Map<String, dynamic> when serialized', () {
      //Arrange

      //act
      final result = user.toMap();

      //
      expect(result, isA<Map<String, dynamic>>());
    });
  });
}
