// https://ashamp.github.io/jsonToDartModel/

class UserModel {
  String? id;
  String? name;
  String? surname;
  String? username;
  String? email;
  String? password;
  String? role;
  int? telephone;
  DateTime? dateBorn;

  UserModel(
    { 
      this.id, 
      this.name,
      this.surname,
      this.username,
      this.email,
      this.password,
      this.role,
      this.telephone,
      this.dateBorn,
    }
  );

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name']?.toString();
    surname = json['surname']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    password = json['password']?.toString();
    role = json['role']?.toString();
    id = json['_id']?.toString();
    telephone = json['telephone'] != null ? int.tryParse(json['telephone']) : null;
    dateBorn = json['dateBorn'] != null ? DateTime.parse(json['dateBorn']) : null;
  }

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['_id'] = id;
    data['telephone'] = telephone;
    data['dateBorn'] = dateBorn;
    return data;
  }
}