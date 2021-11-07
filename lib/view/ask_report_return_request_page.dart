import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'account_list_page.dart';
import 'confirm_report_return_request_page.dart';

class AskReportReturnRequestPage extends StatefulWidget {
  final String userId;
  final String userPassword;
  final String userName;
  final String reportedUserName;
  final String transactionTime;
  final int returnRequestId;

  AskReportReturnRequestPage(
      {required this.userId,
      required this.userPassword,
      required this.userName,
      required this.reportedUserName,
      required this.transactionTime,
      required this.returnRequestId});

  @override
  _AskReportReturnRequestState createState() => _AskReportReturnRequestState();
}

class _AskReportReturnRequestState extends State<AskReportReturnRequestPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRouteWithoutAnimation(
            builder: (context) => AccountListPage(
              userId: widget.userId,
              password: widget.userPassword,
              name: widget.userName,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(200),
            ),
            Text(
              DateTime.parse(widget.transactionTime).month < 10
                  ? DateTime.parse(widget.transactionTime).day < 10
                      ? '${DateTime.parse(widget.transactionTime).year}. 0${DateTime.parse(widget.transactionTime).month}. 0${DateTime.parse(widget.transactionTime).day} ${widget.reportedUserName}님의\n착오 송금건을 신고합니다.'
                      : '${DateTime.parse(widget.transactionTime).year}. 0${DateTime.parse(widget.transactionTime).month}. ${DateTime.parse(widget.transactionTime).day} ${widget.reportedUserName}님의\n착오 송금건을 신고합니다.'
                  : DateTime.parse(widget.transactionTime).day < 10
                      ? '${DateTime.parse(widget.transactionTime).year}. ${DateTime.parse(widget.transactionTime).month} .0${DateTime.parse(widget.transactionTime).day} ${widget.reportedUserName}님의\n착오 송금건을 신고합니다.'
                      : '${DateTime.parse(widget.transactionTime).year}. ${DateTime.parse(widget.transactionTime).month} .${DateTime.parse(widget.transactionTime).day} ${widget.reportedUserName}님의\n착오 송금건을 신고합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Spacer(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _reportReturnRequest();
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
      ),
    );
  }

  Future<dynamic> _reportReturnRequest() async {
    http.Response response = await http.post(
      Uri.parse(
          "http://ec2-18-117-35-204.us-east-2.compute.amazonaws.com:8080/v1/return_requests/report?returnRequestId=${widget.returnRequestId}"),
      headers: {
        "content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRouteWithoutAnimation(
          builder: (context) => ConfirmReportReturnRequestPage(
              userId: widget.userId,
              userPassword: widget.userPassword,
              userName: widget.userName),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text("\n서버 오류가 발생했습니다.\n다시 시도해주세요."),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    return response;
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
