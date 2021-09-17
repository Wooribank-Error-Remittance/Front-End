import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wooribank_error_remittance/view/sent_return_request_list_page.dart';

import 'account_list_page.dart';

class ConfirmAcceptReturnRequestPage extends StatelessWidget {
  final String userId;
  final String userPassword;
  final String userName;

  ConfirmAcceptReturnRequestPage(
      {required this.userId,
      required this.userPassword,
      required this.userName});

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
            Container(
                width: ScreenUtil().setWidth(45),
                height: ScreenUtil().setHeight(45),
                child: Image.asset('assets/request_accepted.png')),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Text(
              '반환 요청을 수락하셨습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            Text(
              '\n이체 시 발생하는 수수료는 송금인이 부담합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  color: Color(0xFFB0B0B0),
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(
                      builder: (context) => AccountListPage(
                          userId: userId,
                          password: userPassword,
                          name: userName),
                    ),
                  );
                },
                icon: Image.asset('assets/button_next.png'),
                iconSize: 80,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            )
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
