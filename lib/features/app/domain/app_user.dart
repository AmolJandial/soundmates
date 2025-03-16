import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;

  const AppUser({this.id = ''});

  AppUser copyWith({String? id}) {
    return AppUser(id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return {'id': id};
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(id: map['id'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];
}
