import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/account_list_page.dart';
import 'package:wooribank_error_remittance/view/sign_up_page.dart';

class LoginCompletePage extends StatelessWidget {
  final String userId;
  final String password;

  LoginCompletePage({required this.userId, required this.password});

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
            '로그인이 완료되었습니다.',
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
                    builder: (context) => AccountListPage(),
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
    );
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
