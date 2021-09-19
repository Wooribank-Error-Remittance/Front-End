import 'dart:core';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/model/return_request_list.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'account_list_page.dart';

class ReportListPage extends StatefulWidget {
  ReturnRequestList? returnRequests;
  final String userId;
  final String password;
  final String name;

  ReportListPage(
      {required this.userId, required this.password, required this.name});

  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportListPage> {
  @override
  void initState() {
    _returnRequests();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            '신고건 목록',
            style: TextStyle(
              color: Colors.black87,
              fontSize: ScreenUtil().setSp(18),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.returnRequests == null
                      ? 0
                      : widget.returnRequests!.returnRequests.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(20),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Text(
                              DateTime.parse(widget
                                              .returnRequests!
                                              .returnRequests[index]
                                              .transactionTime)
                                          .month <
                                      10
                                  ? DateTime.parse(widget
                                                  .returnRequests!
                                                  .returnRequests[index]
                                                  .transactionTime)
                                              .day <
                                          10
                                      ? '${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).month}. 0${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).day}'
                                      : '${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).month}. ${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).day}'
                                  : DateTime.parse(widget
                                                  .returnRequests!
                                                  .returnRequests[index]
                                                  .transactionTime)
                                              .day <
                                          10
                                      ? '${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).month} .0${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).day}'
                                      : '${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).month} .${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).day}',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(100),
                          child: VerticalDivider(
                            color: Colors.grey,
                            width: ScreenUtil().setWidth(5),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Center(
                          child: Container(
                            width: ScreenUtil().setWidth(260),
                            height: ScreenUtil().setHeight(80),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fixedSize: Size(ScreenUtil().setWidth(260),
                                    ScreenUtil().setHeight(80)),
                                primary: Color(0xFFFF766D),
                              ),
                              onPressed: () {},
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0,10,0,10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.returnRequests!.returnRequests[index].receivedUserName}",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(16),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '${NumberFormat('###,###,###,###').format(widget.returnRequests!.returnRequests[index].amount)} 원',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.returnRequests!.returnRequests[index].receivedAccountNumber}",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(16),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '|   ${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).hour}시 ${DateTime.parse(widget.returnRequests!.returnRequests[index].transactionTime).minute}분',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
      if (response.statusCode == 200) {
        setState(() {
          widget.returnRequests = ReturnRequestList.fromJson(
              json.decode(utf8.decode(response.bodyBytes)));

          for (int i = widget.returnRequests!.returnRequests.length - 1;
              i >= 0;
              i--) {
            if (!widget.returnRequests!.returnRequests[i].reported) {
              widget.returnRequests!.returnRequests.removeAt(i);
            }
          }
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Text("\n신고 요청 정보를 가져올 수 없습니다."),
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
