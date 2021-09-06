import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wooribank_error_remittance/view/login_complete_page.dart';
import 'package:wooribank_error_remittance/view/sign_up_complete_page.dart';

import 'certify_account_complete_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();

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
          Center(
            child: Container(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(35),
              child: Text(
                '로그인',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w800),
              ),
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
            height: ScreenUtil().setHeight(12),
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
          Spacer(),
          IconButton(
            onPressed: () {
              MaterialPageRouteWithoutAnimation(
                builder: (context) => LoginCompletePage(),
              );
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