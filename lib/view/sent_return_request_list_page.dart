import 'dart:core';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/model/return_request_list.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:wooribank_error_remittance/view/show_return_request_info_page.dart';

import 'account_list_page.dart';

class SentReturnRequestListPage extends StatefulWidget {
  ReturnRequestList? returnRequests;
  final String userId;
  final String password;
  final String name;

  SentReturnRequestListPage(
      {required this.userId, required this.password, required this.name});

  @override
  _SentReturnRequestListState createState() => _SentReturnRequestListState();
}

class _SentReturnRequestListState extends State<SentReturnRequestListPage> {
  @override
  void initState() {
    _returnRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: ScreenUtil().setHeight(40),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRouteWithoutAnimation(
                  builder: (context) => AccountListPage(
                    userId: widget.userId,
                    password: widget.password,
                    name: widget.name,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black87,
              size: ScreenUtil().setSp(30),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            '보낸 요청 목록',
            style: TextStyle(
              color: Colors.black87,
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
            ),
            Container(
              child: Expanded(
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  // color: Colors.white,
                  width: ScreenUtil().setWidth(300),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.returnRequests == null
                        ? 0
                        : widget.returnRequests!.returnRequests.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Theme(
                            data: theme,
                            child: ExpansionTile(
                              title: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: ScreenUtil().setHeight(25),
                                      width: ScreenUtil().setHeight(25),
                                      child: Image.asset(
                                        'assets/wooribank_account_logo.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(10),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.returnRequests!.returnRequests[index].receivedUserName}',
                                          style: TextStyle(
                                            color: Color(0xFFA7A7A7),
                                            fontSize: ScreenUtil().setSp(12),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Text(
                                          '${widget.returnRequests!.returnRequests[index].receivedAccountNumber}',
                                          style: TextStyle(
                                            color: Color(0xFF3A3A3A),
                                            fontSize: ScreenUtil().setSp(15),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              children: [
                                Container(
                                  height: ScreenUtil().setHeight(50),
                                  color: Color(0xFFDEECFF),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: ScreenUtil().setWidth(20),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateTime.parse(widget
                                                            .returnRequests!
                                                            .returnRequests[
                                                                index]
                                                            .transactionTime)
                                                        .month <
                                                    10
                                                ? DateTime.parse(widget
                                                                .returnRequests!
                                                                .returnRequests[
                                                                    index]
                                                                .transactionTime)
                                                            .day <
                                                        10
                                                    ? '${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).year}. 0${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).month}. 0${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).day}'
                                                    : '${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).year}. 0${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).month}. ${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).day}'
                                                : DateTime.parse(widget
                                                                .returnRequests!
                                                                .returnRequests[
                                                                    index]
                                                                .transactionTime)
                                                            .day <
                                                        10
                                                    ? '${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).year}. ${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).month} .0${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).day}'
                                                    : '${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).year}. ${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).month} .${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).day}',
                                            style: TextStyle(
                                              color: Color(0xFFA7A7A7),
                                              fontSize: ScreenUtil().setSp(12),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenUtil().setHeight(5),
                                          ),
                                          Text(
                                            '${NumberFormat('###,###,###,###').format(widget.returnRequests!.returnRequests[index].amount)} 원',
                                            style: TextStyle(
                                              color: Color(0xFF3A3A3A),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: ScreenUtil().setHeight(33),
                                            width: ScreenUtil().setWidth(33),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRouteWithoutAnimation(
                                                //     builder: (context) =>
                                                //         ShowReturnRequestInfoPage(
                                                //           userId: widget.userId,
                                                //           userPassword:
                                                //           widget.password,
                                                //           userName: widget.name,
                                                //           returnRequestId: widget
                                                //               .returnRequests!
                                                //               .returnRequests[index]
                                                //               .id,
                                                //           transactionAmount: widget
                                                //               .returnRequests!
                                                //               .returnRequests[index]
                                                //               .amount,
                                                //           sentUserName: widget
                                                //               .returnRequests!
                                                //               .returnRequests[index]
                                                //               .sentUserName,
                                                //           sentMessage: widget
                                                //               .returnRequests!
                                                //               .returnRequests[index]
                                                //               .message,
                                                //         ),
                                                //   ),
                                                // );
                                              },
                                              child: widget
                                                      .returnRequests!
                                                      .returnRequests[index]
                                                      .reported
                                                  ? Image.asset(
                                                      'assets/icons/report_blue.png')
                                                  : Image.asset(
                                                      'assets/icons/report_red.png'),
                                              style: ElevatedButton.styleFrom(
                                                onPrimary: Colors.transparent,
                                                primary: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                padding: EdgeInsets.all(0),
                                                onSurface: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(10),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 2,
                            indent: ScreenUtil().setWidth(10),
                            endIndent: ScreenUtil().setWidth(10),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRouteWithoutAnimation(
            builder: (context) => AccountListPage(
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

  Future<dynamic> _returnRequests() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "http://ec2-18-118-230-121.us-east-2.compute.amazonaws.com:8080/v1/return_requests/sending?userId=${widget.userId}"),
        headers: {
          "content-type": "application/json",
        },
      );
      print('hiiiiii');
      if (response.statusCode == 200) {
        setState(() {
          widget.returnRequests = ReturnRequestList.fromJson(
              json.decode(utf8.decode(response.bodyBytes)));

          for (int i = widget.returnRequests!.returnRequests.length - 1;
              i >= 0;
              i--) {
            if (widget.returnRequests!.returnRequests[i].concluded) {
              widget.returnRequests!.returnRequests.removeAt(i);
            }
          }
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Text("\n반환 요청 정보를 가져올 수 없습니다."),
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
