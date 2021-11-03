import 'dart:convert';

class UserDat {
  final String email;
  final String name;

  UserDat(
      this.email,
      this.name,);
}

class UserLogin {
   final int id_user;
  final String email;
   final String password;


  UserLogin(
      this.id_user,this.email,this.password,
     );
}

class Usuario {
   int? id_user;
   String? email;
   String? password;
    int? id_role;



  Usuario({
     this.id_user,
       this.email,
       this.password,
    this.id_role,
  });



  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id_user: json['id_user'],
        email: json['email'],
        password: json['password'],
        id_role: json['id_role']);
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
       this.password,);
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
        statusCode: json['statusCode'],);
  }


List<ErrorRegistro> parsePost(String responseBody) {
 final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ErrorRegistro>((json) => ErrorRegistro.fromJson(json)).toList();
}

}