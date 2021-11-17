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
  final int fb_complete;
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
      this.value_level,
           this.fb_complete);
}


class InfoDatauser {
   int? id_infouser;
   String? name;
   String? surname;
   int? age;
   dynamic weight;
   String? gender;
   dynamic height;
   int? id_activity;


  InfoDatauser({
     this.id_infouser,
      this.name,
      this.surname,
      this.age,
      this.weight,
      this.gender,
      this.height,
      this.id_activity,
  });

  factory InfoDatauser.fromJson(Map<String, dynamic> json) {
    return InfoDatauser(
        id_infouser: json['id_infouser'],
        name: json['name'],
        surname: json['surname'],
        age: json['age'],
        weight: json['weight'],
        gender: json['gender'],
                height: json['height'],
           id_activity: json['id_activity']);

  }
}

List<InfoDatauser> parsePost4(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<InfoDatauser>((json) => InfoDatauser.fromJson(json))
      .toList();
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
  final int fb_complete;

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
      this.initialCalories,
      this.fb_complete);
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
  int? fb_complete;
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
    this.fb_complete
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
        value_level: json['value_level'],
             fb_complete: json['fb_complete']);
  }
}

List<Usuario> parsePost(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}



class UsuarioDataupdate {
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
  int? fb_complete;
  UsuarioDataupdate({
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
    this.fb_complete
  });

  factory UsuarioDataupdate.fromJson(Map<String, dynamic> json) {
    return UsuarioDataupdate(
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
        value_level: json['value_level'],
          fb_complete: json['fb_complete']);
  }
}

List<UsuarioDataupdate> parsePostupdate(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<UsuarioDataupdate>((json) => UsuarioDataupdate.fromJson(json)).toList();
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
