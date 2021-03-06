import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'enter_return_request_info_page.dart';

class AskMakeReturnRequestPage extends StatelessWidget {
  final String userId;
  final String userPassword;
  final String userName;
  final String bankName;
  final String accountNumber;
  final int transactionId;
  final double transactionAmount;
  final String transactionTime;

  AskMakeReturnRequestPage(
      {required this.userId,
      required this.userPassword,
      required this.userName,
      required this.bankName,
      required this.accountNumber,
      required this.transactionId,
      required this.transactionAmount,
      required this.transactionTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(55),
          ),
          Container(
              height: ScreenUtil().setHeight(245),
              width: ScreenUtil().setWidth(326),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/return_request_checkbox.png'),
                fit: BoxFit.contain,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(35),
                      ),
                      Text(
                        "${bankName} ${accountNumber}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "${bankName} ${accountNumber}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(35),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          Text(
            '?????? ??????????????? ??????\n????????? ?????????????????????????',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.blue,
                fontWeight: FontWeight.w700),
          ),
          Text(
            '\n?????? ??? ??????????????? ????????? ???????????? ???????????????.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                color: Color(0xFFB0B0B0),
                fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRouteWithoutAnimation(
                        builder: (context) => EnterReturnRequestInfoPage(
                            userId: userId,
                            userPassword: userPassword,
                            userName: userName,
                            transactionId: transactionId,
                            transactionAmount: transactionAmount,
                            transactionTime: transactionTime),
                      ),
                    );
                  },
                  icon: Image.asset('assets/button_accept.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/button_decline.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          )
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
