import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:wooribank_error_remittance/model/transaction_list.dart';
import 'package:wooribank_error_remittance/view/ask_return_request_page.dart';

import 'account_list_page.dart';

class AccountStatementPage extends StatefulWidget {
  final String userId;
  final String password;
  final String name;
  final String accountBank;
  final String accountName;
  final String accountNumber;
  final double accountBalance;
  final int accountId;
  TransactionList? transactions;
  int indexYear = DateTime
      .now()
      .year;
  int indexMonth = DateTime
      .now()
      .month;

  AccountStatementPage({required this.userId,
    required this.password,
    required this.name,
    required this.accountBank,
    required this.accountName,
    required this.accountNumber,
    required this.accountBalance,
    required this.accountId});

  @override
  _AccountStatementState createState() => _AccountStatementState();
}

class _AccountStatementState extends State<AccountStatementPage> {
  @override
  void initState() {
    _getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: Border(bottom: BorderSide(color: Color(0xFF1C65B9), width: 0)),
          toolbarHeight: ScreenUtil().setHeight(40),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRouteWithoutAnimation(
                  builder: (context) =>
                      AccountListPage(
                        userId: widget.userId,
                        password: widget.password,
                        name: widget.name,
                      ),
                ),
              );
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: ScreenUtil().setSp(30),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            '거래내역조회',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
          backgroundColor: Color(0xFF1C65B9),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Color(0xFF1C65B9),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(18),
                      ),
                      Text(
                        '${widget.accountName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(18),
                      ),
                      Text(
                        '${widget.accountNumber}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${NumberFormat('###,###,###,###').format(
                            widget.accountBalance)} 원',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(40),
              color: Color(0xFFF9F9F9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.transactions!.transactions.clear();
                        if (widget.indexMonth == 1) {
                          widget.indexMonth = 12;
                          widget.indexYear -= 1;
                        } else {
                          widget.indexMonth -= 1;
                        }
                      });
                      _getTransactions();
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      color: Color(0xFF5E5E5E),
                      size: ScreenUtil().setSp(26),
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  Text(
                    widget.indexMonth < 10
                        ? '${widget.indexYear}.0${widget.indexMonth}'
                        : '${widget.indexYear}.${widget.indexMonth}',
                    style: TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.transactions!.transactions.clear();
                        if (widget.indexMonth == 12) {
                          widget.indexMonth = 1;
                          widget.indexYear += 1;
                        } else {
                          widget.indexMonth += 1;
                        }
                      });
                      _getTransactions();
                    },
                    icon: Icon(
                      Icons.chevron_right,
                      color: Color(0xFF5E5E5E),
                      size: ScreenUtil().setSp(26),
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            Expanded(
              child: widget.transactions == null
                  ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 0,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [],
                  );
                },
              )
                  : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.transactions == null
                    ? 0
                    : widget.transactions!.transactions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (widget.transactions!.transactions[index]
                              .infoTarget ==
                              "sender" &&
                              widget.transactions!.transactions[index]
                                  .isReturnRequested ==
                                  false) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0)),
                                  ),
                                  child: Container(
                                    height: ScreenUtil().setHeight(200),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFF3297F7),
                                          width: 2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height:
                                          ScreenUtil().setHeight(40),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '착오송금액 반환 요청',
                                                textAlign:
                                                TextAlign.center,
                                                style: TextStyle(
                                                  color:
                                                  Color(0xFF3297F7),
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontSize: ScreenUtil()
                                                      .setSp(17),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Color(0xFF3297F7),
                                          width: double.infinity,
                                          height:
                                          ScreenUtil().setHeight(100),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '해당 거래내역에 대해\n반환을 요청하시겠습니까?',
                                                textAlign:
                                                TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontSize: ScreenUtil()
                                                      .setSp(16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height:
                                          ScreenUtil().setHeight(50),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: ScreenUtil()
                                                    .setHeight(50),
                                                width: ScreenUtil()
                                                    .setWidth(120),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRouteWithoutAnimation(
                                                        builder: (context) =>
                                                            AskReturnRequestPage(
                                                              bankName: widget.accountBank,
                                                              accountNumber: widget.accountNumber,
                                                              transactionId: widget.transactions!.transactions[index].id,
                                                              transactionAmount: widget.transactions!.transactions[index].amount,
                                                              transactionTime: widget.transactions!.transactions[index].timeOfOccurrence,
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                  child: Image.asset(
                                                      'assets/button_accept.png'),
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                    shadowColor: Colors
                                                        .transparent,
                                                    primary: Colors.white,
                                                    onSurface:
                                                    Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: ScreenUtil()
                                                    .setHeight(50),
                                                width: ScreenUtil()
                                                    .setWidth(120),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context);
                                                  },
                                                  child: Image.asset(
                                                      'assets/button_decline.png'),
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                    shadowColor: Colors
                                                        .transparent,
                                                    primary: Colors.white,
                                                    onSurface:
                                                    Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: ScreenUtil().setHeight(3),
                                ),
                                Text(
                                  DateTime
                                      .parse(widget
                                      .transactions!
                                      .transactions[index]
                                      .timeOfOccurrence)
                                      .month <
                                      10
                                      ? DateTime
                                      .parse(widget
                                      .transactions!
                                      .transactions[index]
                                      .timeOfOccurrence)
                                      .day <
                                      10
                                      ? '0${DateTime
                                      .parse(
                                      widget.transactions!.transactions[index]
                                          .timeOfOccurrence)
                                      .month}.0${DateTime
                                      .parse(
                                      widget.transactions!.transactions[index]
                                          .timeOfOccurrence)
                                      .day}'
                                      : '0${DateTime
                                      .parse(
                                      widget.transactions!.transactions[index]
                                          .timeOfOccurrence)
                                      .month}.${DateTime
                                      .parse(
                                      widget.transactions!.transactions[index]
                                          .timeOfOccurrence)
                                      .day}'
                                      : DateTime
                                      .parse(widget
                                      .transactions!
                                      .transactions[index]
                                      .timeOfOccurrence)
                                      .day <
                                      10
                                      ? '${DateTime
                                      .parse(
                                      widget.transactions!.transactions[index]
                                          .timeOfOccurrence)
                                      .month}.0${DateTime
                                      .parse(
                                      widget.transactions!.transactions[index]
                                          .timeOfOccurrence)
                                      .day}'
                                      : '${DateTime
                                      .parse(
                                      widget.transactions!.transactions[index]
                                          .timeOfOccurrence)
                                      .month}.${DateTime
                                      .parse(
                                      widget.transactions!.transactions[index]
                                          .timeOfOccurrence)
                                      .day}',
                                  style: TextStyle(
                                    color: Color(0xFF3A3A3A),
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(10),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: ScreenUtil().setHeight(4),
                                ),
                                Text(
                                  widget.transactions!.transactions[index]
                                      .infoTarget ==
                                      "sender"
                                      ? '${widget.transactions!
                                      .transactions[index].receiverName}'
                                      : '${widget.transactions!
                                      .transactions[index].senderName}',
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(5),
                                ),
                                Text(
                                  widget.transactions!.transactions[index]
                                      .infoTarget ==
                                      "sender"
                                      ? '${widget.transactions!
                                      .transactions[index].sendingMethod}'
                                      : '${widget.transactions!
                                      .transactions[index].receivingMethod}',
                                  style: TextStyle(
                                    color: Color(0xFF747474),
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  widget.transactions!.transactions[index]
                                      .infoTarget ==
                                      "sender"
                                      ? '-${widget.transactions!
                                      .transactions[index].amount
                                      .toStringAsFixed(0)} 원'
                                      : '+${widget.transactions!
                                      .transactions[index].amount
                                      .toStringAsFixed(0)} 원',
                                  style: TextStyle(
                                    color: widget
                                        .transactions!
                                        .transactions[index]
                                        .infoTarget ==
                                        "sender"
                                        ? Color(0xFFFF0000)
                                        : Color(0xFF3297F7),
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(6),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: EdgeInsets.fromLTRB(
                              ScreenUtil().setSp(14),
                              ScreenUtil().setSp(10),
                              ScreenUtil().setSp(14),
                              ScreenUtil().setSp(12)),
                          fixedSize: Size(double.infinity,
                              ScreenUtil().setHeight(70)),
                          primary: Colors.white, // background
                        ),
                      ),
                      Divider(
                        height: 2,
                        color: Color(0xFFE2DFDF),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRouteWithoutAnimation(
            builder: (context) =>
                AccountListPage(
                  userId: widget.userId,
                  password: widget.password,
                  name: widget.name,
                ),
          ),
        );
        return true;
      },
    );
  }

  Future<dynamic> _getTransactions() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "http://ec2-18-118-230-121.us-east-2.compute.amazonaws.com:8080/v1/transactions?accountId=${widget
                .accountId}&year=${widget.indexYear}&month=${widget
                .indexMonth}"),
        headers: {
          "content-type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          widget.transactions = TransactionList.fromJson(
              json.decode(utf8.decode(response.bodyBytes)));
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Text("\n거래 내역을 가져올 수 없습니다."),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } on Exception {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text("\n서버와 연결할 수 없습니다."),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
