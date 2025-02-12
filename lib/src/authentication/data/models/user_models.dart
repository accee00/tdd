import 'package:tdd_demo/core/utils/typedef.dart';
import 'package:tdd_demo/src/authentication/domain/enities/user.dart';
import 'dart:convert';

class UserModels extends User {
  const UserModels({
    required super.id,
    required super.name,
    required super.createdAt,
    required super.avatar,
  });

  const UserModels.empty() : this(id: '', createdAt: '', name: '', avatar: '');
  factory UserModels.fromJson(String source) =>
      UserModels.fromMap(jsonDecode(source) as DataMap);

  // Data extracted from server and passed on to UserModels.fromMap.
  UserModels.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          name: map['name'] as String,
          createdAt: map['createdAt'] as String,
          avatar: map['avatar'] as String,
        );

  String toJson() => jsonEncode(toMap());

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'avatar': avatar,
    };
  }

  UserModels copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? avatar,
  }) {
    return UserModels(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }
}
