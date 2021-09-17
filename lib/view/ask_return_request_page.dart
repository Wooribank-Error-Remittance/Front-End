import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/confirm_return_request_page.dart';
import 'package:wooribank_error_remittance/view/sign_up_page.dart';

import 'enter_return_request_info_page.dart';

class AskReturnRequestPage extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final int transactionId;
  final double transactionAmount;
  final String transactionTime;


  AskReturnRequestPage(
      {required this.bankName,
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
            '해당 송금내역에 대해\n반환을 요청하시겠습니까?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.blue,
                fontWeight: FontWeight.w700),
          ),
          Text(
            '\n반환 시 이체수수료 제외한 금액만이 회수됩니다.',
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
                          transactionId: transactionId,
                          transactionAmount: transactionAmount,
                          transactionTime: transactionTime
                        ),
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
