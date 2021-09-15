import 'package:flutter/cupertino.dart';
import 'package:wooribank_error_remittance/model/account.dart';

class AccountList with ChangeNotifier{
  final List<Account> accounts;

  AccountList(
      {required this.accounts});

  factory AccountList.fromJson(Map<String, dynamic> json) {
    var accounts = json['data']['accountList'] as List;
    List <Account> accountList = accounts.map((i) =>Account.fromJson(i)).toList();
    return AccountList(
      accounts: accountList,
    );
  }
}
