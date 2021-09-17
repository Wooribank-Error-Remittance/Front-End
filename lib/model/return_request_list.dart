import 'package:flutter/cupertino.dart';
import 'package:wooribank_error_remittance/model/account.dart';
import 'package:wooribank_error_remittance/model/return_request.dart';

class ReturnRequestList with ChangeNotifier{
  final List<ReturnRequest> returnRequests;

  ReturnRequestList(
      {required this.returnRequests});

  factory ReturnRequestList.fromJson(Map<String, dynamic> json) {
    var returnRequests = json['data']['returnRequestList'] as List;
    List <ReturnRequest> returnRequestList = returnRequests.map((i) =>ReturnRequest.fromJson(i)).toList();
    return ReturnRequestList(
      returnRequests: returnRequestList,
    );
  }
}
