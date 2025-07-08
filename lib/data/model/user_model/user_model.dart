import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  final int? createdAt;
  final String? name;
  final String? email;
  final String? password;
  final String? id;

  Users({
    this.createdAt,
    this.name,
    this.email,
    this.password,
    this.id,
  });

  Users copyWith({
    int? createdAt,
    String? name,
    String? email,
    String? password,
    String? id,
  }) =>
      Users(
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        id: id ?? this.id,
      );

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        createdAt: json["createdAt"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "email": email,
        "password": password,
        "id": id,
      };
}
