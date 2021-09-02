import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wooribank_error_remittance/view/sign_up_complete_page.dart';

import 'certify_account_complete_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCheckController = TextEditingController();
  String authMessage = "특수문자,대문자 포함 8자리 이상";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/wooribank_logo.png',
              fit: BoxFit.contain,
              height: ScreenUtil().setHeight(25),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            height: ScreenUtil().setHeight(35),
            child: Text(
              '회원가입',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: TextField(
              controller: idController,
              decoration: InputDecoration(
                hintText: 'ID',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'PW',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "          " + authMessage,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(12), color: Colors.lightBlue),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: TextField(
              obscureText: true,
              controller: passwordCheckController,
              decoration: InputDecoration(
                hintText: 'PW 확인',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              if (passwordController.text!=passwordCheckController.text||passwordController.text.length<8) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text("\n비밀번호가 올바르지 않습니다."),
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
              else {
                Navigator.push(
                  context,
                  MaterialPageRouteWithoutAnimation(
                    builder: (context) => SignUpCompletePage(),
                  ),
                );
              }
            },
            icon: Image.asset('assets/button_accept.png'),
            iconSize: 80,
          ),
        ],
      ),
    );
  }


}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);
  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}