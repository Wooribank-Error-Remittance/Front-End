import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wooribank_error_remittance/model/account_list.dart';
import 'package:wooribank_error_remittance/view/first_page.dart';
import 'package:wooribank_error_remittance/view/received_return_request_list_page.dart';
import 'package:wooribank_error_remittance/view/report_list_page.dart';
import 'package:wooribank_error_remittance/view/sent_return_request_list_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'account_statement_page.dart';

class AccountListPage extends StatefulWidget {
  AccountList? accounts;
  final String userId;
  final String password;
  final String name;

  AccountListPage(
      {required this.userId, required this.password, required this.name});

  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountListPage> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    _getAccounts();
    _handleMessage();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _key,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/wooribank_logo.png',
                fit: BoxFit.contain,
                height: ScreenUtil().setHeight(25),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
        endDrawer: Container(
          width: ScreenUtil().setWidth(210),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(50),
                  child: const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(''),
                  ),
                ),
                ExpansionTile(
                  title: new Text(
                    "반환 현황",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w500),
                  ),
                  children: [
                    Divider(height: 3),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRouteWithoutAnimation(
                            builder: (context) => SentReturnRequestListPage(
                              userId: widget.userId,
                              password: widget.password,
                              name: widget.name,
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black87,
                      ),
                      child: Row(
                        children: [
                          Text("   보낸 요청 목록"),
                          Spacer(),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRouteWithoutAnimation(
                            builder: (context) => ReceivedReturnRequestListPage(
                              userId: widget.userId,
                              password: widget.password,
                              name: widget.name,
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black87,
                      ),
                      child: Row(
                        children: [
                          Text("   받은 요청 목록"),
                          Spacer(),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: new Text(
                    "신고건 목록",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w500),
                  ),
                  children: [],
                  trailing: Icon(Icons.chevron_right),
                  onExpansionChanged: (bool isExpanded) {
                    Navigator.push(
                      context,
                      MaterialPageRouteWithoutAnimation(
                        builder: (context) => ReportListPage(
                          userId: widget.userId,
                          password: widget.password,
                          name: widget.name,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Center(
              child: Container(
                width: ScreenUtil().setWidth(290),
                height: ScreenUtil().setHeight(35),
                child: Text(
                  '${widget.name}님',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Center(
              child: Container(
                width: ScreenUtil().setWidth(290),
                height: ScreenUtil().setHeight(1),
                child: Divider(
                  thickness: 1.2,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(18),
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.accounts != null) {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(
                      builder: (context) => AccountStatementPage(
                        userId: widget.userId,
                        password: widget.password,
                        name: widget.name,
                        accountBank: widget.accounts!.accounts.first.bank,
                        accountName: widget.accounts!.accounts.first.name,
                        accountNumber: widget.accounts!.accounts.first.number,
                        accountBalance: widget.accounts!.accounts.first.balance,
                        accountId: widget.accounts!.accounts.first.id,
                      ),
                    ),
                  );
                }
              },
              child: widget.accounts == null
                  ? Column(children: [])
                  : Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(11),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${widget.accounts!.accounts.first.name}',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(6),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${widget.accounts!.accounts.first.number}',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${NumberFormat('###,###,###,###').format(widget.accounts!.accounts.first.balance)}원',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                animationDuration: Duration(days: 10000),
                fixedSize: Size(
                    ScreenUtil().setWidth(295), ScreenUtil().setHeight(120)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Color(0xFF1690F0),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(16),
            ),
            Container(
              child: Expanded(
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  // color: Colors.white,
                  width: ScreenUtil().setWidth(300),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.accounts == null ||
                        widget.accounts!.accounts.length == 1
                        ? 0
                        : widget.accounts!.accounts.length - 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRouteWithoutAnimation(
                                    builder: (context) => AccountStatementPage(
                                      userId: widget.userId,
                                      password: widget.password,
                                      name: widget.name,
                                      accountBank: widget
                                          .accounts!.accounts[index + 1].bank,
                                      accountName: widget
                                          .accounts!.accounts[index + 1].name,
                                      accountNumber: widget
                                          .accounts!.accounts[index + 1].number,
                                      accountBalance: widget.accounts!
                                          .accounts[index + 1].balance,
                                      accountId: widget
                                          .accounts!.accounts[index + 1].id,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: ScreenUtil().setHeight(25),
                                    width: ScreenUtil().setHeight(25),
                                    child: Image.asset(
                                      'assets/wooribank_account_logo.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.accounts!.accounts[index + 1].name}',
                                        style: TextStyle(
                                          color: Color(0xFFA7A7A7),
                                          fontSize: ScreenUtil().setSp(12),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '${NumberFormat('###,###,###,###').format(widget.accounts!.accounts[index + 1].balance)} 원',
                                        style: TextStyle(
                                          color: Color(0xFF3A3A3A),
                                          fontSize: ScreenUtil().setSp(15),
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Color(0xFF3A3A3A),
                                    size: ScreenUtil().setSp(20),
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(6),
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.fromLTRB(
                                    ScreenUtil().setSp(14),
                                    ScreenUtil().setSp(10),
                                    ScreenUtil().setSp(14),
                                    ScreenUtil().setSp(10)),
                                fixedSize: Size(ScreenUtil().setWidth(300),
                                    ScreenUtil().setHeight(50)),
                                primary: Colors.white, // background
                              ),
                            ),
                          ),
                          Divider(
                            height: 2,
                            indent: ScreenUtil().setWidth(10),
                            endIndent: ScreenUtil().setWidth(10),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(8),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '+',
                style: TextStyle(
                    color: Color(0xFF717171),
                    fontSize: ScreenUtil().setSp(19),
                    fontWeight: FontWeight.w400),
              ),
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                animationDuration: Duration(days: 10000),
                fixedSize: Size(
                    ScreenUtil().setWidth(280), ScreenUtil().setHeight(33)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Color(0xFFFAFAFA),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(280),
              child: Divider(
                height: ScreenUtil().setHeight(25),
                thickness: ScreenUtil().setSp(1.3),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await LaunchApp.openApp(
                  androidPackageName: 'com.wooribank.smart.npib'
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/xrp.png',
                    fit: BoxFit.contain,
                    height: ScreenUtil().setHeight(16),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    '우리 WON 뱅킹 바로가기',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                animationDuration: Duration(days: 10000),
                splashFactory: NoSplash.splashFactory,
                fixedSize: Size(
                    ScreenUtil().setWidth(280), ScreenUtil().setHeight(40)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Color(0xFF1690F0),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(45),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              child: Container(
                height: ScreenUtil().setHeight(200),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF3297F7), width: 2),
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
                            '알림',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF3297F7),
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xFF3297F7),
                      width: double.infinity,
                      height: ScreenUtil().setHeight(100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '로그아웃 하시겠습니까?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(16),
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
                                _firebaseMessaging.deleteToken();
                                Navigator.push(
                                  context,
                                  MaterialPageRouteWithoutAnimation(
                                    builder: (context) => FirstPage(),
                                  ),
                                );
                              },
                              child:
                              Image.asset('assets/button_accept.png'),
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
                              child:
                              Image.asset('assets/button_decline.png'),
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
            ));
        return true;
      },
    );
  }

  Future<dynamic> _getAccounts() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "http://ec2-18-118-230-121.us-east-2.compute.amazonaws.com:8080/v1/accounts?userId=${widget.userId}&password=${widget.password}"),
        headers: {
          "content-type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          widget.accounts = AccountList.fromJson(
              json.decode(utf8.decode(response.bodyBytes)));
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new Text("\n계좌 정보를 가져올 수 없습니다."),
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
    } on Exception {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text("\n서버와 연결할 수 없습니다."),
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
  }

  void _handleMessage() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.onMessage.listen(
          (RemoteMessage message) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              child: Container(
                height: ScreenUtil().setHeight(200),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF3297F7), width: 2),
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
                              color: Color(0xFF3297F7),
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xFF3297F7),
                      width: double.infinity,
                      height: ScreenUtil().setHeight(100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${message.notification!.body}\n확인하시겠습니까?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(13),
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
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRouteWithoutAnimation(
                                    builder: (context) => ReceivedReturnRequestListPage(
                                      userId: widget.userId,
                                      password: widget.password,
                                      name: widget.name,
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset('assets/button_accept.png'),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRouteWithoutAnimation(
                                    builder: (context) => AccountListPage(
                                      userId: widget.userId,
                                      password: widget.password,
                                      name: widget.name,
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset('assets/button_decline.png'),
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
    );
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
