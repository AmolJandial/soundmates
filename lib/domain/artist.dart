import 'dart:convert';

import 'package:equatable/equatable.dart';

class Artist extends Equatable {
  final String mbid;
  final String name;
  final List<String> genres;
  final String imageUrl;

  const Artist({this.mbid = '', this.name = '', this.genres = const [], this.imageUrl = ''});

  Map<String, dynamic> toMap() {
    return {'mbid': mbid, 'name': name, 'genres': genres, 'imageUrl': imageUrl};
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      mbid: map['mbid'] ?? '',
      name: map['name'] ?? '',
      genres: List<String>.from(map['genres'] ?? const []),
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) => Artist.fromMap(json.decode(source));

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [mbid, name, genres, imageUrl];
}
