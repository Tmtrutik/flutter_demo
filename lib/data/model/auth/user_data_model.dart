import 'dart:convert';

UserInfoData userInfoDataFromJson(String str) => UserInfoData.fromJson(json.decode(str));

String userInfoDataToJson(UserInfoData data) => json.encode(data.toJson());

class UserInfoData {
  final String? name;
  final String? email;
  final Access? tokenId;
  final String? photoUrl;

  UserInfoData({
    this.name,
    this.email,
    this.tokenId,
    this.photoUrl,
  });

  UserInfoData copyWith({
    String? name,
    String? email,
    Access? tokenId,
    String? photoUrl,
  }) {
    return UserInfoData(
      name: name ?? this.name,
      email: email ?? this.email,
      tokenId: tokenId ?? this.tokenId,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  factory UserInfoData.fromJson(Map<String, dynamic> json) {
    return UserInfoData(
      name: json["name"],
      email: json["email"],
      tokenId: json["tokenId"] != null ? Access.fromJson(json["tokenId"]) : null,
      photoUrl: json["photoUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "tokenId": tokenId?.toJson(),
      "photoUrl": photoUrl,
    };
  }

  @override
  String toString() {
    return 'UserInfoData(name: $name, email: $email, tokenId: $tokenId, photoUrl: $photoUrl)';
  }
}

class Access {
  final String? token;
  final DateTime? expires;

  Access({
    this.token,
    this.expires,
  });

  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(
      token: json["token"],
      expires: json["expires"] != null ? DateTime.tryParse(json["expires"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "expires": expires?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Access(token: $token, expires: $expires)';
  }
}
