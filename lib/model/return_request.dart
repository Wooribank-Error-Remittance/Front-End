import 'package:flutter/cupertino.dart';

class ReturnRequest with ChangeNotifier {
  final double amount;
  final bool concluded;
  final int id;
  final String receivedAccountNumber;
  final String receivedUserName;
  final bool reported;
  final String sentAccountNumber;
  final String sentUserName;
  final String transactionTime;
  final String message;


  ReturnRequest({
    required this.amount,
    required this.concluded,
    required this.id,
    required this.receivedAccountNumber,
    required this.receivedUserName,
    required this.reported,
    required this.sentAccountNumber,
    required this.sentUserName,
    required this.transactionTime,
    required this.message});

  factory ReturnRequest.fromJson(Map<String, dynamic> json) {
    return ReturnRequest(
        amount: json['amount'] as double,
        id: json['id'] as int,
        concluded: json['concluded'] as bool,
        reported: json['reported'] as bool,
        receivedAccountNumber: json['receivedAccountNumber'] as String,
        receivedUserName: json['receivedUserName'] as String,
        sentAccountNumber: json['sentAccountNumber'] as String,
        sentUserName: json['sentUserName'] as String,
        transactionTime: json['transactionTime'] as String,
        message: json['message'] as String
    );
  }
}
