import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;

  String get getId => id;
  String get getName => name;
  String get getEmail => email;
  String get getPassword => password;

  const User({required this.id,required this.name, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id:json['id'],
      name:json['name'],
      email:json['email'],
      password:json['password'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'id':id,'name': name, 'email': email, 'password': password};

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, password];
}
