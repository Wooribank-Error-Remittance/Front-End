import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('first_page created');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/wooribank_logo.png',
              fit: BoxFit.contain,
              height: ScreenUtil().setHeight(25),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(7),
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(50),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    primary: Colors.black87,
                    alignment: Alignment.centerLeft,
                    side: BorderSide(color: Colors.black26)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/person_outline.png',
                      fit: BoxFit.contain,
                      height: ScreenUtil().setHeight(16),
                    ),
                    Text('   로그인'),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(7),
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(50),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    primary: Colors.black87,
                    alignment: Alignment.centerLeft,
                    side: BorderSide(color: Colors.black26)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/face_id.png',
                      fit: BoxFit.contain,
                      height: ScreenUtil().setHeight(16),
                    ),
                    Text("   우리은행 계좌 인증"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
