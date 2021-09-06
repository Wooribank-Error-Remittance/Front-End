import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/certify_account_page.dart';

import 'login_page.dart';

class FirstPage extends StatelessWidget {
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
            height: ScreenUtil().setHeight(40),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(7),
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(50),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
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
                    Spacer(),
                    Icon(Icons.chevron_right),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(
                      builder: (context) => CertifyAccountPage(),
                    ),
                  );
                },
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
                    Spacer(),
                    Icon(Icons.chevron_right),
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

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
