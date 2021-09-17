import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'account_list_page.dart';

class ConfirmReturnRequestPage extends StatelessWidget {
  final String userId;
  final String userPassword;
  final String userName;
  final int transactionId;
  final double transactionAmount;
  final String transactionTime;
  final String returnRequestMessage;

  ConfirmReturnRequestPage(
      {required this.userId,
      required this.userPassword,
      required this.userName,
      required this.transactionId,
      required this.transactionAmount,
      required this.transactionTime,
      required this.returnRequestMessage});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRouteWithoutAnimation(
            builder: (context) => AccountListPage(
              userId: userId,
              password: userPassword,
              name: userName,
            ),
          ),
        );
        return true;
      },
      child: Scaffold(
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
              height: ScreenUtil().setHeight(200),
            ),
            Text(
              '${DateTime.parse(transactionTime).month}월 ${DateTime.parse(transactionTime).day}일 ${NumberFormat('###,###,###,###').format(transactionAmount)}원에 대해\n반환을 요청하셨습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Center(
              child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/button_accept.png'),
                iconSize: 80,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ),
          ],
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
