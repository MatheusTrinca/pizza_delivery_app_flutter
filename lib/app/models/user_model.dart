import 'dart:convert';

class UserModel {
  int id;
  String name;
  String password;
  
  UserModel({
    this.id,
    this.name,
    this.password,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      id: map['id'],
      name: map['name'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
