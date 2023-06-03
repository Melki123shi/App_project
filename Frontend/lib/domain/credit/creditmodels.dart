import 'package:equatable/equatable.dart';

class Credit extends Equatable {
  final String id;
  final String status;
  final DateTime takenDate;
  final DateTime paidDate;
  final String paidAmount;
  final String remainingAmount;
 
  String get getid => id;
  String get getstatus => status;
  DateTime get getakenDate => takenDate;
  DateTime get getpaidDate => paidDate;
  String get getpaidAmount => paidAmount;
  String get getremainingAmount => remainingAmount;
  

  const Credit(
    {required this.id,
    required this.status,
    required this.takenDate,
    required this.paidDate,
    required this.paidAmount,
    required this.remainingAmount,
   }
  );


  factory Credit.fromJson(Map<String, dynamic> json) {
    return Credit(
      id:json['_id'],
      status:json['status'],
      takenDate:DateTime.parse(json['takenDate']),
      paidDate: DateTime.parse(json['paidDate']),
      paidAmount:json[' paidAmount'],
      remainingAmount:json['remainingAmount'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'status': status,
        'takenDate': takenDate,
        'paidDate': paidDate,
        'paidAmountd':paidAmount,
        'remainingAmount': remainingAmount,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id,status,takenDate , paidDate, remainingAmount];
}
