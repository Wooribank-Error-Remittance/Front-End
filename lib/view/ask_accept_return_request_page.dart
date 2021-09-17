import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:wooribank_error_remittance/view/confirm_accept_return_request_page.dart';

import 'account_list_page.dart';

class AskAcceptReturnRequestPage extends StatefulWidget {
  final String userId;
  final String userPassword;
  final String userName;
  final int returnRequestId;

  AskAcceptReturnRequestPage(
      {required this.userId,
      required this.userPassword,
      required this.userName,
      required this.returnRequestId});

  @override
  _AskAcceptReturnRequestListState createState() =>
      _AskAcceptReturnRequestListState();
}

class _AskAcceptReturnRequestListState
    extends State<AskAcceptReturnRequestPage> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(170),
          ),
          Text(
            '착오송금액 반환에\n동의하시겠습니까?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(23),
                color: Colors.blue,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Text(
            '\n거부 시 예금보험공사에서 지급명령을 신청할 수 있고,\n착오송금액 무단 사용 시 횡령죄로 처벌받을 수 있습니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: Color(0xFFB0B0B0),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(25),
          ),
          Container(
            width: ScreenUtil().setWidth(290),
            height: ScreenUtil().setHeight(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isChecked ? Color(0xFF535353) : Color(0xFFB0B0B0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(5),
                          ),
                          Container(
                            height: ScreenUtil().setHeight(10),
                            width: ScreenUtil().setWidth(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: isChecked
                                      ? AssetImage('assets/agreement_on.png')
                                      : AssetImage('assets/agreement_off.png')),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(10),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "전자금융거래 및 전자금융거래서비스 이용약관,\n개인정보 수집 및 이용에 동의합니다.",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(13),
                                    color: isChecked
                                        ? Color(0xFF535353)
                                        : Color(0xFFB0B0B0)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    if (isChecked) {
                      _acceptReturnRequest();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            content: Container(
                              width: 300.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\n\n이용 약관 및 개인정보 처리방침에 따라\n약관을 읽고 동의하셔야 합니다.\n",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              Column(
                                children: [
                                  Divider(
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        child: new Text(
                                          "확인",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          primary: Colors.white,
                                          onSurface: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: Image.asset('assets/button_accept.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: Container(
                            height: ScreenUtil().setHeight(200),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFFF7474), width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: ScreenUtil().setHeight(40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '착오송금액 반환요청 알림',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFF7474),
                                          fontWeight: FontWeight.w600,
                                          fontSize: ScreenUtil().setSp(17),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Color(0xFFFF7474),
                                  width: double.infinity,
                                  height: ScreenUtil().setHeight(100),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '※ 거절시 법적 처벌을 받을 수 있습니다.\n거절하시겠습니까?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: ScreenUtil().setSp(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: ScreenUtil().setHeight(50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: ScreenUtil().setHeight(50),
                                        width: ScreenUtil().setWidth(120),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRouteWithoutAnimation(
                                                builder: (context) =>
                                                    AccountListPage(
                                                  userId: widget.userId,
                                                  password: widget.userPassword,
                                                  name: widget.userName,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            'assets/button_accept.png',
                                            color: Color(0xFFFF7474),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            primary: Colors.white,
                                            onSurface: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(50),
                                        width: ScreenUtil().setWidth(120),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Image.asset(
                                            'assets/button_decline.png',
                                            color: Color(0xFFFF7474),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            primary: Colors.white,
                                            onSurface: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
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

  Future<dynamic> _acceptReturnRequest() async {
    http.Response response = await http.post(
      Uri.parse(
          "http://ec2-18-118-230-121.us-east-2.compute.amazonaws.com:8080/v1/return_requests/accept?returnRequestId=${widget.returnRequestId}"),
      headers: {
        "content-type": "application/json",
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRouteWithoutAnimation(
          builder: (context) => ConfirmAcceptReturnRequestPage(
              userId: widget.userId,
              userPassword: widget.userPassword,
              userName: widget.userName),
        ),
      );
    } else {
      print('no!!');
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
