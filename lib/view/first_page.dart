import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
              height: 25,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(7),
              width: 300,
              height: 60,
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
                      height: 16,
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
              width: 300,
              height: 60,
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
                      height: 16,
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
