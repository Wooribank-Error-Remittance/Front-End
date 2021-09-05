import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/sign_up_page.dart';

class CertifyAccountCompletePage extends StatelessWidget {
  final String name;
  final String phoneNumber;

  CertifyAccountCompletePage({required this.name, required this.phoneNumber});

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
            height: ScreenUtil().setHeight(200),
          ),
          Text(
            '계좌 인증이 완료되었습니다.\n회원가입 페이지로 이동합니다.',
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
                    builder: (context) => SignUpPage(
                      name: name,
                      phoneNumber: phoneNumber,
                    ),
                  ),
                );
              },
              icon: Image.asset('assets/button_accept.png'),
              iconSize: 80,
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
