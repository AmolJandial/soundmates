import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserLocation extends Equatable {
  final String type;
  final List<double> coordinates;

  const UserLocation({this.type = 'Point', this.coordinates = const []});

  Map<String, dynamic> toMap() {
    return {'type': type, 'coordinates': coordinates};
  }

  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(type: map['type'] ?? '', coordinates: List<double>.from(map['coordinates'] ?? const []));
  }

  String toJson() => json.encode(toMap());

  factory UserLocation.fromJson(String source) => UserLocation.fromMap(json.decode(source));

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [type, coordinates];
}
