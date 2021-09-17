import 'package:flutter/cupertino.dart';

class Account with ChangeNotifier {
  final double balance;
  final int id;
  final String bank;
  final String name;
  final String number;

  Account(
      {required this.balance,
      required this.id,
      required this.bank,
      required this.name,
      required this.number});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      balance: json['balance'] as double,
      id: json['id'] as int,
      bank: json['bank'] as String,
      name: json['name'] as String,
      number: json['number'] as String,
    );
  }
}
