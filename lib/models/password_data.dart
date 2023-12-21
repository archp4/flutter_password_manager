// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PasswordData {
  String title;
  String userId;
  String password;
  bool isFavorite;
  int type;
  PasswordData({
    required this.title,
    required this.userId,
    required this.password,
    required this.isFavorite,
    required this.type,
  });

  PasswordData copyWith({
    String? title,
    String? userId,
    String? password,
    bool? isFavorite,
    int? type,
  }) {
    return PasswordData(
      title: title ?? this.title,
      userId: userId ?? this.userId,
      password: password ?? this.password,
      isFavorite: isFavorite ?? this.isFavorite,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'userId': userId,
      'password': password,
      'isFavorite': isFavorite,
      'type': type,
    };
  }

  factory PasswordData.fromMap(Map<String, dynamic> map) {
    return PasswordData(
      title: map['title'] as String,
      userId: map['userId'] as String,
      password: map['password'] as String,
      isFavorite: map['isFavorite'] as bool,
      type: map['type'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PasswordData.fromJson(String source) =>
      PasswordData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PasswordData(title: $title, userId: $userId, password: $password, isFavorite: $isFavorite, type: $type)';
  }

  @override
  bool operator ==(covariant PasswordData other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.userId == userId &&
        other.password == password &&
        other.isFavorite == isFavorite &&
        other.type == type;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        userId.hashCode ^
        password.hashCode ^
        isFavorite.hashCode ^
        type.hashCode;
  }
}
