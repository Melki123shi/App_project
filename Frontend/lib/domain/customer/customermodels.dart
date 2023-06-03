import 'dart:convert';

import 'package:equatable/equatable.dart';


class Customer extends Equatable {
  final String id;
  final List<int> idPhoto;
  final String fullName;

  String get getid => id;
  List<int> get getidPhoto => idPhoto;
  String get getfullName => fullName;

  const Customer({
    required this.id,
    required this.idPhoto,
    required this.fullName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['_id'],
      idPhoto: base64Decode(json['idPhoto']),
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'idPhoto': base64Encode(idPhoto),
        'fullName': fullName,
      };

  @override
  List<Object?> get props => [id, idPhoto, fullName];
}
