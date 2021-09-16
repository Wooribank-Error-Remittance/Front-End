import 'package:flutter/cupertino.dart';
import 'package:wooribank_error_remittance/model/account.dart';
import 'package:wooribank_error_remittance/model/transaction.dart';

class TransactionList with ChangeNotifier{
  final List<Transaction> transactions;

  TransactionList(
      {required this.transactions});

  factory TransactionList.fromJson(Map<String, dynamic> json) {
    var transactions = json['data']['transactionList'] as List;
    List <Transaction> transactionList = transactions.map((i) =>Transaction.fromJson(i)).toList();
    return TransactionList(
      transactions: transactionList,
    );
  }
}
