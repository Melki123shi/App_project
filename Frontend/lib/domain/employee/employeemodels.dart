import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String id;
  final String userName;
  final String fullName;
  final String address;
  final String email;
  final String phoneNumber;
  final int numberOfCarsSold;
  final String moneyGathered;
  final String hiredDate;
  final int numberOfCreditLeft;



  String get getid => id;
  String get getuserName => userName;
  String get getfullName => fullName;
  String get getaddress => address;
  String get getemail => email;
  String get getphoneNumber => phoneNumber;
  int get getnumberOfCarsSold => numberOfCarsSold;
  String get getmoneyGathered => moneyGathered;
  String get gethiredDate => hiredDate;
  int get getnumberOfCreditLeft => numberOfCreditLeft;


  const Employee({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.numberOfCarsSold,
    required this.moneyGathered,
    required this.hiredDate,
    required this.numberOfCreditLeft,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
  return Employee(
    id: json['_id'],
    userName: json['userName'],
    fullName: json['fullName'],
    address: json['address'],
    email: json['email'],
    phoneNumber: json['phoneNumber'],
    numberOfCarsSold: json['numberOfCarsSold'],
    numberOfCreditLeft: json['numberOfCreditLeft'],
    moneyGathered: json['moneyGathered'],
    hiredDate: json['hiredDate'],
  );
}


  Map<String, dynamic> toJson() => {
        'userName': userName,
        'fullName': fullName,
        'address': address,
        'email': email,
        'phoneNumber': phoneNumber,
        'numberOfCarsSold': numberOfCarsSold,
        'moneyGathered': moneyGathered,
        'hiredDate': hiredDate,
        'numberOfCreditLeft': numberOfCreditLeft,
      };

  @override
  List<Object?> get props => [
        userName,
        fullName,
        address,
        email,
        phoneNumber,
        numberOfCarsSold,
        moneyGathered,
        hiredDate,
        numberOfCreditLeft,
      
      ];
}
