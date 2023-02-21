// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class UserModel {
  String? FirstName;
  String email;
  String? SecondName;
  String? UserName;
  List<String>? friends;
  UserModel({
    this.FirstName,
    required this.email,
    this.SecondName,
    this.UserName,
    this.friends,
  });

  UserModel copyWith({
    String? FirstName,
    String? email,
    String? SecondName,
    String? UserName,
    List<String>? friends,
  }) {
    return UserModel(
      FirstName: FirstName ?? this.FirstName,
      email: email ?? this.email,
      SecondName: SecondName ?? this.SecondName,
      UserName: UserName ?? this.UserName,
      friends: friends ?? this.friends,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'FirstName': FirstName,
      'email': email,
      'SecondName': SecondName,
      'UserName': UserName,
      'friends': friends,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      FirstName: map['FirstName'] != null ? map['FirstName'] as String : null,
      email: map['email'] as String,
      SecondName:
          map['SecondName'] != null ? map['SecondName'] as String : null,
      UserName: map['UserName'] != null ? map['UserName'] as String : null,
      friends: map['friends'] != null
          ? List<String>.from((map['friends'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(FirstName: $FirstName, email: $email, SecondName: $SecondName, UserName: $UserName, friends: $friends)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.FirstName == FirstName &&
        other.email == email &&
        other.SecondName == SecondName &&
        other.UserName == UserName &&
        listEquals(other.friends, friends);
  }

  @override
  int get hashCode {
    return FirstName.hashCode ^
        email.hashCode ^
        SecondName.hashCode ^
        UserName.hashCode ^
        friends.hashCode;
  }
}
