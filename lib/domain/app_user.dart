import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:soundmates/domain/artist.dart';
import 'package:soundmates/domain/user_location.dart';
import 'package:soundmates/enums/gender.dart';

class AppUser extends Equatable {
  final String id;
  final String name;
  final String description;
  final int age;
  final String phoneNumber;
  //enum
  final Gender gender;
  final List<Artist> favoriteArtists;
  final UserLocation location;

  const AppUser({
    this.id = '',
    this.name = '',
    this.description = '',
    this.age = 0,
    this.phoneNumber = '',
    this.gender = Gender.other,
    this.favoriteArtists = const [],
    this.location = const UserLocation(),
  });

  factory AppUser.dummy() => const AppUser(
    id: '132nej2bj2',
    name: 'Hitagi Yuno',
    description: 'Hello how are you my name is this, and yeag and yeag yup, yup, pretty true',
    age: 24,
    phoneNumber: '+919729801261',
    gender: Gender.male,
    favoriteArtists: [
      Artist(mbid: '347g3274g237', name: 'Melanie Martinez', genres: ['Pop', 'alt']),
    ],
    location: UserLocation(coordinates: [21.121, 141.1212]),
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'age': age,
      'phoneNumber': phoneNumber,
      'gender': gender.index,
      'favoriteArtists': favoriteArtists.map((x) => x.toMap()).toList(),
      'location': location.toMap(),
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      age: map['age'] ?? 0,
      phoneNumber: map['phoneNumber'] ?? '',
      gender: Gender.values[map['gender'] ?? 3],
      favoriteArtists: List<Artist>.from(map['favoriteArtists'].map((x) => Artist.fromMap(x)) ?? const []),
      location: UserLocation.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source));

  @override
  bool? get stringify => true;

  @override
  List<Object> get props {
    return [id, name, description, age, phoneNumber, gender, favoriteArtists, location];
  }
}
