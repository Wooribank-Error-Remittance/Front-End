import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/received_return_request_list_page.dart';
import 'package:wooribank_error_remittance/view/report_list_page.dart';
import 'package:wooribank_error_remittance/view/sent_return_request_list_page.dart';

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
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(35),
              child: Text(
                name + '님',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Center(
            child: Container(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(1),
              child: Divider(
                thickness: 1.2,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          Center(
            child: Container(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(35),
              child: Text(
                '계좌',
                style: TextStyle(
                    color: Color(0xFF0364AD),
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: ScreenUtil().setHeight(30));
              },
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(5),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '계좌 종류',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '계좌 번호',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(25),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '잔액',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(25),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(ScreenUtil().setWidth(300),
                          ScreenUtil().setHeight(100)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: (index % 2 == 0)
                          ? Color(0xFF3E97F7)
                          : Color(0xFF1C65B9), // background
                      // onPrimary: Colors.white, // foreground
                    ),
                  ),
                );
              },
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
