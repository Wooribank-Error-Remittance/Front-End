import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/received_return_request_list_page.dart';
import 'package:wooribank_error_remittance/view/report_list_page.dart';
import 'package:wooribank_error_remittance/view/sent_return_request_list_page.dart';

import 'account_statement_page.dart';

class AccountListPage extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountListPage> {
  final String name = "김우리";

  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          builder: (context) => SentReturnRequestListPage(),
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
                          builder: (context) => ReceivedReturnRequestListPage(),
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
                      builder: (context) => ReportListPage(),
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
                name + '님',
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
              Navigator.push(
                context,
                MaterialPageRouteWithoutAnimation(
                  builder: (context) => AccountStatementPage(),
                ),
              );
            },
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(11),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'WON 통장',
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
                    '1002-123-456789',
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
                    '100,000원',
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
              fixedSize:
                  Size(ScreenUtil().setWidth(295), ScreenUtil().setHeight(120)),
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
                  itemCount: 3,
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
                                  builder: (context) => AccountStatementPage(),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'WON 통장',
                                      style: TextStyle(
                                        color: Color(0xFFA7A7A7),
                                        fontSize: ScreenUtil().setSp(12),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '300,000 원',
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
              fixedSize:
                  Size(ScreenUtil().setWidth(280), ScreenUtil().setHeight(33)),
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
            onPressed: () {},
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
              fixedSize:
                  Size(ScreenUtil().setWidth(280), ScreenUtil().setHeight(40)),
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
    );
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
