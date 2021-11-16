import 'dart:convert';

class UserDat {
  final String email;
  final String name;
  final String id;
  UserDat(
    this.email,
    this.name,
    this.id
  );
}

class UsuariodataSet {
  final int id_user;
  final String email;
  final String password;
  final int id_role;
  final String name;
  final String surname;
  final int age;
  final dynamic weight;
  final String gender;
  final dynamic height;
  final String name_level;
  final double value_level;

  UsuariodataSet(
      this.id_user,
      this.email,
      this.password,
      this.id_role,
      this.name,
      this.surname,
      this.age,
      this.weight,
      this.gender,
      this.height,
      this.name_level,
      this.value_level);
}


class SendUserDataInfo {
  final int id_user;
  final String email;
  final String password;
  final int id_role;
  final String name;
  final String surname;
  final int age;
  final dynamic weight;
  final String gender;
  final dynamic height;
  final String name_level;
  final double value_level;
  final int initialCalories ;

  SendUserDataInfo(
      this.id_user,
      this.email,
      this.password,
      this.id_role,
      this.name,
      this.surname,
      this.age,
      this.weight,
      this.gender,
      this.height,
      this.name_level,
      this.value_level,
      this.initialCalories);
}


class Usuario {
  int? id_user;
  String? email;
  String? password;
  int? id_role;
  String? name;
  String? surname;
  int? age;
  dynamic weight;
  String? gender;
  dynamic height;
  String? name_level;
  double? value_level;

  Usuario({
    this.id_user,
    this.email,
    this.password,
    this.id_role,
    this.name,
    this.surname,
    this.age,
    this.weight,
    this.gender,
    this.height,
    this.name_level,
    this.value_level,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id_user: json['id_user'],
        email: json['email'],
        password: json['password'],
        id_role: json['id_role'],
        name: json['name'],
        surname: json['surname'],
        age: json['age'],
        weight: json['weight'],
        gender: json['gender'],
        height: json['height'],
        name_level: json['name_level'],
        value_level: json['value_level']);
  }
}

List<Usuario> parsePost(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}

class UserRegistroStep2 {
  final String email;
  final String password;

  UserRegistroStep2(
    this.email,
    this.password,
  );
}

class UserRegistroStep3 {
  final String email;
  final String password;
  final String name;
  final String surname;
  final String age;

  UserRegistroStep3(
    this.email,
    this.password,
    this.name,
    this.surname,
    this.age,
  );
}

class ErrorRegistro {
  String? message;
  String? statusCode;

  ErrorRegistro({
    this.message,
    this.statusCode,
  });

  factory ErrorRegistro.fromJson(Map<String, dynamic> json) {
    return ErrorRegistro(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }

  List<ErrorRegistro> parsePost(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<ErrorRegistro>((json) => ErrorRegistro.fromJson(json))
        .toList();
  }
}
