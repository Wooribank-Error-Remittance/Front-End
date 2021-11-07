import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/sign_up_complete_page.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  final String name;
  final String phoneNumber;

  SignUpPage({required this.name, required this.phoneNumber});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCheckController = TextEditingController();
  int idCheckFlag = 0;
  int pwCheckFlag = 0;
  int pwRepCheckFlag = 0;

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
            child: TextFormField(
              controller: idController,
              decoration: InputDecoration(
                hintText: 'ID',
                contentPadding: EdgeInsets.all(5.0),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: idCheckFlag == 0
                      ? Colors.grey
                      : idCheckFlag == 1
                          ? Colors.blueAccent
                          : Colors.red,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: ScreenUtil().setSp(2),
                  color: idCheckFlag == 0
                      ? Colors.grey
                      : idCheckFlag == 1
                          ? Colors.blueAccent
                          : Colors.red,
                )),
              ),
              onChanged: (value) {
                RegExp regExp = new RegExp(r'^[a-zA-Z0-9]{4,12}$');
                setState(() {
                  if (value.isEmpty) {
                    idCheckFlag = 0;
                  } else if (regExp.hasMatch(value!)) {
                    idCheckFlag = 1;
                  } else {
                    idCheckFlag = 2;
                  }
                });
              },
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(34),
                ),
                Text(
                  "영어 대소문자 또는 숫자 4자리 이상 15자리 이내",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'PW',
                contentPadding: EdgeInsets.all(5.0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: pwCheckFlag == 0
                        ? Colors.grey
                        : pwCheckFlag == 1
                            ? Colors.blueAccent
                            : Colors.red,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: ScreenUtil().setSp(2),
                    color: pwCheckFlag == 0
                        ? Colors.grey
                        : pwCheckFlag == 1
                            ? Colors.blueAccent
                            : Colors.red,
                  ),
                ),
              ),
              onChanged: (value) {
                RegExp regExp = new RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$');
                setState(() {
                  if (value.isEmpty) {
                    pwCheckFlag = 0;
                  } else if (regExp.hasMatch(value!)) {
                    pwCheckFlag = 1;
                  } else {
                    pwCheckFlag = 2;
                  }
                });
              },
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(34),
                ),
                Text(
                  "특수문자,대문자,숫자 포함 8자리 이상 15자리 이내",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: TextFormField(
              obscureText: true,
              controller: passwordCheckController,
              decoration: InputDecoration(
                hintText: 'PW 확인',
                contentPadding: EdgeInsets.all(5.0),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: pwRepCheckFlag == 0
                      ? Colors.grey
                      : pwRepCheckFlag == 1
                          ? Colors.blueAccent
                          : Colors.red,
                )),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: ScreenUtil().setSp(2),
                    color: pwRepCheckFlag == 0
                        ? Colors.grey
                        : pwRepCheckFlag == 1
                            ? Colors.blueAccent
                            : Colors.red,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (passwordCheckController.text.isEmpty) {
                    pwRepCheckFlag = 0;
                  } else if (passwordController.text ==
                      passwordCheckController.text) {
                    pwRepCheckFlag = 1;
                  } else {
                    pwRepCheckFlag = 2;
                  }
                });
              },
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              if (idCheckFlag == 1 && pwCheckFlag == 1 && pwRepCheckFlag == 1) {
                try {
                  _SignUpAndLoadAccounts();
                } finally {}
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text("\n입력 정보를 확인해주세요."),
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
            },
            icon: Image.asset('assets/button_accept.png'),
            iconSize: 80,
          ),
        ],
      ),
    );
  }

  Future<dynamic> _SignUpAndLoadAccounts() async {
    http.Response response = await http.post(
      Uri.parse(
          "http://ec2-18-117-35-204.us-east-2.compute.amazonaws.com:8080/v1/sign/complete"),
      headers: {
        "content-type": "application/json",
      },
      body: json.encode({
        "name": widget.name,
        "password": passwordController.text,
        "phoneNumber": widget.phoneNumber,
        "userId": idController.text
      }),
    );

    print(response.statusCode);

    http.Response response2 = await http.post(
      Uri.parse(
          "http://ec2-18-117-35-204.us-east-2.compute.amazonaws.com:8080/v1/accounts/update"),
      headers: {
        "content-type": "application/json",
      },
      body: json.encode(
          {"password": passwordController.text, "userId": idController.text}),
    );
    print(response2.statusCode);

    if (response.statusCode == 200 && response2.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRouteWithoutAnimation(
          builder: (context) => SignUpCompletePage(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text("\n서버 오류가 발생했습니다."),
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
