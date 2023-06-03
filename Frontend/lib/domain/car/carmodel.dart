import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Car extends Equatable {
  final String id;
  final String carId;
  final String make;
  final String photo;
  final String color;
  final String model;
  final double horsePower;
  final List<String> safetyFeatures;
  final bool isAutomatic;
  final double price;
  final DateTime dayBought;
  final DateTime daySold;
  final bool isSold;
  final double negotiationLimit;
  final bool byCredit;
  final bool byNegotiation;
  final double negotiationPrice;
  final double creditLimit;
  final double priceSoldWith;

  String get getid => id;
  String get getcarId => carId;
  String get getmake => make;
  String get getphoto => photo;
  String get getcolor => color ;
  String get getmodel => model;
  double get gethorsePower => horsePower;
  List<String> get getsafetyFeatures => safetyFeatures;
  bool get getisAutomatic => isAutomatic;
  double get getprice => price;
  DateTime get getdayBought => dayBought;
  DateTime get getdaySold => daySold;
  bool get getisSold => isSold;
  double get getnegotiationLimit => negotiationLimit;
  bool get getbyCredit => byCredit;
  bool get getbyNegotiation => byNegotiation;
  double get getnegotiationPrice => negotiationPrice;
  double get getcreditLimit => creditLimit;
  double get getpriceSoldWith => priceSoldWith;

 
  const Car( 
    {required this.id,
    required this.carId,
    required this.make,
    required this.photo,
    required this.color,
    required this.model,
    required this.horsePower,
    required this.safetyFeatures,
    required this.isAutomatic,
    required this.price,
    required this.dayBought,
    required this.daySold,
    required this.isSold,
    required this.negotiationLimit,
    required this.byCredit,
    required this.byNegotiation,
    required this.negotiationPrice,
    required this.creditLimit,
    required this.priceSoldWith,}
);

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['_id'],
      carId:json['carId'],
      make:json['make'],
      photo:json['photo'],
      color:json['color'],
      model:json['model'],
      horsePower:json['horsePower'],
      safetyFeatures: List<String>.from(json['safetyFeatures']),
      isAutomatic:json['isAutomatic'],
      price:json['price'],
      dayBought: DateTime.parse(json['dayBought']),
      daySold:json['daySold'],
      isSold:json['isSold'],
      negotiationLimit:json['negotiationLimit'],
      byCredit:json['byCredit'],
      byNegotiation:json['byNegotiation'],
      negotiationPrice:json['negotiationPrice'],
      creditLimit:json['creditLimit'],
      priceSoldWith:json['priceSoldWith'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'carId': carId,
        'make': make,
        'photo': photo,
        'color': color,
        'model': model,
        'horsePower': horsePower,
        'saftyFeatures': safetyFeatures,
        'isAutomatic': isAutomatic,
        'price': price,
        'dayBought': dayBought,
        'daySold': daySold,
        'isSold': isSold,
        'negotiationLimit': negotiationLimit,
        'byCredit': byCredit,
        'byNegotiation': byNegotiation,
        'negotiationPrice': negotiationPrice,
        'creditLimit': creditLimit,
        'priceSoldWith': priceSoldWith,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id,carId, make, photo,color,model,horsePower,isAutomatic, 
  price,dayBought,daySold,isSold,negotiationLimit, byCredit, byNegotiation, negotiationPrice,creditLimit,priceSoldWith,];
}


