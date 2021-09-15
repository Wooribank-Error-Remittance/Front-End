import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'certify_account_complete_page.dart';

class CertifyAccountPage extends StatefulWidget {
  @override
  _CertifyAccountState createState() => _CertifyAccountState();
}

class _CertifyAccountState extends State<CertifyAccountPage> {
  final nameController = TextEditingController();
  final frontRRNController = TextEditingController();
  final backRRNController = TextEditingController();
  final phoneNumberController1 = TextEditingController(text: '010');
  final phoneNumberController2 = TextEditingController();
  final phoneNumberController3 = TextEditingController();
  final certificationNumberController = TextEditingController();
  bool isSMSRequested = false;
  bool isAuthenticated = false;
  String authMessage = "인증 요청을 해주세요.";
  late String verificationId;
  FirebaseAuth _auth = FirebaseAuth.instance;

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
              '계좌 확인',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: '이름 입력',
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenUtil().setWidth(138),
                child: TextField(
                  controller: frontRRNController,
                  decoration: InputDecoration(
                    hintText: '주민번호 앞 6자리',
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
              Text(
                ' - ',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
              Container(
                width: ScreenUtil().setWidth(138),
                child: TextField(
                  controller: backRRNController,
                  decoration: InputDecoration(
                    hintText: '뒤 7자리',
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenUtil().setWidth(80),
                child: TextFormField(
                  controller: phoneNumberController1,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
              Text(
                ' - ',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
              Container(
                width: ScreenUtil().setWidth(85),
                child: TextField(
                  controller: phoneNumberController2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
              Text(
                ' - ',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
              Container(
                width: ScreenUtil().setWidth(85),
                child: TextField(
                  controller: phoneNumberController3,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenUtil().setWidth(200),
                child: TextField(
                  controller: certificationNumberController,
                  decoration: InputDecoration(
                    hintText: 'SMS 인증',
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(12),
              ),
              Container(
                // width: ScreenUtil().setWidth(100),
                child: ElevatedButton(
                  onPressed: () async {
                    // 인증 요청
                    if (!isSMSRequested) {
                      await _auth.verifyPhoneNumber(
                        codeAutoRetrievalTimeout: (String verificationId) {},
                        phoneNumber: "+8210" +
                            phoneNumberController2.text.trim() +
                            phoneNumberController3.text.trim(),
                        verificationCompleted: (phoneAuthCredential) async {},
                        verificationFailed: (verificationFailed) async {},
                        codeSent: (verificationId, resendingToken) async {
                          authMessage = "인증번호를 발송하였습니다.";
                          setState(() {
                            isSMSRequested = true;
                            this.verificationId = verificationId;
                          });
                        },
                      );
                    }
                    // 인증 확인
                    else {
                      SignInWithPhoneAuthCredential(
                          PhoneAuthProvider.credential(
                              verificationId: verificationId,
                              smsCode: certificationNumberController.text));
                    }
                  },
                  child: !isSMSRequested
                      ? Text(
                          '인증 요청',
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        )
                      : Text(
                          '인증 확인',
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                  style: !isSMSRequested
                      ? ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          primary: Colors.white38,
                          // side: BorderSide(width: 0, color: Colors.white38),
                        )
                      : ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          primary: Colors.white38,
                          // side: BorderSide(width: 0, color: Colors.white38),
                        ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(3),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "          " + authMessage,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(12), color: Colors.lightBlue),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              if (isAuthenticated &&
                  nameController.text != null &&
                  frontRRNController.text.length == 6 &&
                  backRRNController.text.length == 7) {
                Navigator.push(
                  context,
                  MaterialPageRouteWithoutAnimation(
                    builder: (context) => CertifyAccountCompletePage(
                      name: nameController.text,
                      phoneNumber: "+8210" +
                          phoneNumberController2.text.trim() +
                          phoneNumberController3.text.trim(),
                    ),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: new Text("\n입력 및 인증 절차를 완료해주세요."),
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
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  void SignInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        setState(() {
          print('인증완료 및 로그인 성공');
          isAuthenticated = true;
          authMessage = "인증되었습니다.";
        });
        await _auth.currentUser!.delete();
        print('auth정보삭제');
        _auth.signOut();
        print('phone로그인된것 아웃');
      }
    } on FirebaseAuthException catch (e) {
      print("인증 실패..로그인실패");
      authMessage = "인증번호가 올바르지 않습니다.";
    }
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
