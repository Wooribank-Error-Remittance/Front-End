import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wooribank_error_remittance/view/confirm_return_request_page.dart';
import 'package:wooribank_error_remittance/view/sign_up_page.dart';

class EnterReturnRequestInfoPage extends StatelessWidget {
  final int transactionId;
  final double transactionAmount;
  final String transactionTime;

  EnterReturnRequestInfoPage(
      {required this.transactionId,
      required this.transactionAmount,
      required this.transactionTime});

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Color(0xFF5CAAFF), width: 0)),
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
        backgroundColor: Color(0xFF5CAAFF),
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF5CAAFF), Colors.transparent],
            stops: [0.3, 0.3],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '착오송금액',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      width: ScreenUtil().setWidth(282),
                      height: ScreenUtil().setHeight(44),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${NumberFormat('###,###,###,###').format(transactionAmount)} 원",
                            style: TextStyle(
                              color: Color(0xFF5C5C5C),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Text(
                      '수취인에게 전달할 메시지',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      width: ScreenUtil().setWidth(282),
                      height: ScreenUtil().setHeight(224),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: messageController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: Color(0xFF5C5C5C),
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(
                      builder: (context) => ConfirmReturnRequestPage(
                          transactionId: transactionId,
                          transactionAmount: transactionAmount,
                          transactionTime: transactionTime,
                          returnRequestMessage: messageController.text),
                    ),
                  );
                },
                icon: Image.asset('assets/button_send.png'),
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
