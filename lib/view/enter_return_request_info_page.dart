import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wooribank_error_remittance/view/confirm_make_return_request_page.dart';
import 'package:http/http.dart' as http;

class EnterReturnRequestInfoPage extends StatefulWidget {
  final String userId;
  final String userPassword;
  final String userName;
  final int transactionId;
  final double transactionAmount;
  final String transactionTime;

  EnterReturnRequestInfoPage(
      {required this.userId,
      required this.userPassword,
      required this.userName,
      required this.transactionId,
      required this.transactionAmount,
      required this.transactionTime});

  @override
  _EnterReturnRequestInfoState createState() => _EnterReturnRequestInfoState();
}

class _EnterReturnRequestInfoState extends State<EnterReturnRequestInfoPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isChecked = false;
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: Border(bottom: BorderSide(color: Color(0xFF5CAAFF), width: 0)),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                'assets/wooribank_logo.png',
                fit: BoxFit.contain,
                height: ScreenUtil().setHeight(25),
              )
            ],
          ),
          backgroundColor: Color(0xFF5CAAFF),
          elevation: 0.0,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF5CAAFF), Colors.transparent],
              stops: [0.3, 0.3],
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '착오송금액',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        width: ScreenUtil().setWidth(282),
                        height: ScreenUtil().setHeight(44),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${NumberFormat('###,###,###,###').format(widget.transactionAmount)} 원",
                              style: TextStyle(
                                color: Color(0xFF5C5C5C),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Text(
                        '수취인에게 전달할 메시지',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        width: ScreenUtil().setWidth(282),
                        height: ScreenUtil().setHeight(224),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          autofocus: false,
                          controller: messageController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              color: Color(0xFF5C5C5C),
                              fontWeight: FontWeight.w700),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: ScreenUtil().setWidth(5),
                                    ),
                                    Container(
                                      height: ScreenUtil().setHeight(10),
                                      width: ScreenUtil().setWidth(10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: isChecked
                                                ? AssetImage(
                                                    'assets/agreement_on.png')
                                                : AssetImage(
                                                    'assets/agreement_off.png')),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(10),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "전자금융거래 및 전자금융거래서비스 이용약관,\n개인정보 수집 및 이용에 동의합니다.",
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(13),
                                              color: Color(0xFF535353)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: IconButton(
                  onPressed: () {
                    if (isChecked) {
                      _makeReturnRequest();
                    } else {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            content: Container(
                              width: 300.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\n\n이용 약관 및 개인정보 처리방침에 따라\n약관을 읽고 동의하셔야 합니다.\n",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              Column(
                                children: [
                                  Divider(
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        child: new Text(
                                          "확인",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          primary: Colors.white,
                                          onSurface: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: Image.asset('assets/button_send.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _makeReturnRequest() async {
    http.Response response = await http.post(
      Uri.parse(
          "http://ec2-18-118-230-121.us-east-2.compute.amazonaws.com:8080/v1/return_requests"),
      headers: {
        "content-type": "application/json",
      },
      body: json.encode({
        "message": messageController.text,
        "transactionId": widget.transactionId,
      }),
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRouteWithoutAnimation(
          builder: (context) => ConfirmMakeReturnRequestPage(
              userId: widget.userId,
              userPassword: widget.userPassword,
              userName: widget.userName,
              transactionId: widget.transactionId,
              transactionAmount: widget.transactionAmount,
              transactionTime: widget.transactionTime,
              returnRequestMessage: messageController.text),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text("\n서버 오류가 발생했습니다.\n다시 시도해주세요."),
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

    return response;
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
