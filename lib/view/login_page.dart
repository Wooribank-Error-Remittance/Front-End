import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/model/woori_user.dart';
import 'package:wooribank_error_remittance/view/login_complete_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  String? FCMToken;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    _firebaseMessaging.getToken().then((value) => FCMToken = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              try {
                _Login();
              } finally {}
            },
            icon: Image.asset('assets/button_accept.png'),
            iconSize: 80,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Future<dynamic> _Login() async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            "http://ec2-18-118-230-121.us-east-2.compute.amazonaws.com:8080/v1/sign/login"),
        headers: {
          "content-type": "application/json",
        },
        body: json.encode(
            {"password": passwordController.text, "userId": idController.text, "fcmToken" : FCMToken}),
      );

      if (response.statusCode == 200) {
        WooriUser loginDto =
            WooriUser.fromJson(json.decode(utf8.decode(response.bodyBytes)));

        Navigator.push(
          context,
          MaterialPageRouteWithoutAnimation(
            builder: (context) => LoginCompletePage(
                userId: idController.text,
                password: passwordController.text,
                name: loginDto.name),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Text("\n입력하신 정보와 일치하는 계정이 존재하지 않습니다."),
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
    } catch (e) {
      print(e);
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
