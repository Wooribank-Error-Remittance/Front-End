import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/sent_return_request_list_page.dart';

class ConfirmReportReturnRequestPage extends StatelessWidget {
  final String userId;
  final String userPassword;
  final String userName;

  ConfirmReportReturnRequestPage(
      {required this.userId,
      required this.userPassword,
      required this.userName,});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRouteWithoutAnimation(
            builder: (context) => SentReturnRequestListPage(
                userId: userId,
                password: userPassword,
                name: userName),
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
              '신고하셨습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(
                      builder: (context) => SentReturnRequestListPage(
                          userId: userId,
                          password: userPassword,
                          name: userName),
                    ),
                  );
                },
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
