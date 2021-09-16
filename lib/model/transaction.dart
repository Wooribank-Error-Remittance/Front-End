import 'package:flutter/cupertino.dart';

class Transaction with ChangeNotifier{
  final int id;
  final String infoTarget;
  final String timeOfOccurrence;
  final String senderName;
  final String receiverName;
  final String sendingMethod;
  final String receivingMethod;
  final double amount;
  final int sentAccountId;
  final int receivedAccountId;
  final bool isReturnRequested;


  Transaction({
      required this.id,
      required this.infoTarget,
      required this.timeOfOccurrence,
      required this.senderName,
      required this.receiverName,
      required this.sendingMethod,
      required this.receivingMethod,
      required this.amount,
      required this.sentAccountId,
      required this.receivedAccountId,
      required this.isReturnRequested});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as int,
      infoTarget: json['infoTarget'] as String,
      timeOfOccurrence: json['timeOfOccurrence'] as String,
      senderName: json['senderName'] as String,
      receiverName: json['receiverName'] as String,
      sendingMethod: json['sendingMethod'] as String,
      receivingMethod: json['receivingMethod'] as String,
      amount: json['amount'] as double,
      sentAccountId: json['sentAccountId'] as int,
      receivedAccountId: json['receivedAccountId'] as int,
      isReturnRequested: json['isReturnRequested'] as bool,
    );
  }
}
