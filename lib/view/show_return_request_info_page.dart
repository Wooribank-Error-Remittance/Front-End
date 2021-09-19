import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wooribank_error_remittance/view/ask_accept_return_request_page.dart';

class ShowReturnRequestInfoPage extends StatefulWidget {
  final String userId;
  final String userPassword;
  final String userName;
  final int returnRequestId;
  final String sentMessage;
  final double transactionAmount;
  final String sentUserName;

  ShowReturnRequestInfoPage(
      {required this.userId,
      required this.userPassword,
      required this.userName,
      required this.returnRequestId,
      required this.sentMessage,
      required this.transactionAmount,
      required this.sentUserName});

  @override
  _ShowReturnRequestInfoState createState() => _ShowReturnRequestInfoState();
}

class _ShowReturnRequestInfoState extends State<ShowReturnRequestInfoPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

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
              stops: [0.41, 0.41],
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(35),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '송금인',
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
                              "${widget.sentUserName} 님",
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
                        '송금인이 전달한 메시지',
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
                        padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
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
                        child: Text(
                          '${widget.sentMessage}',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              color: Color(0xFF5C5C5C),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRouteWithoutAnimation(
                        builder: (context) =>
                            AskAcceptReturnRequestPage(
                              userId: widget.userId,
                              userPassword: widget.userPassword,
                              userName: widget.userName,
                              returnRequestId: widget.returnRequestId,
                            ),
                      ),
                    );
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
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
