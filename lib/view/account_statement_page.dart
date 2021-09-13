import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_button/slide_button.dart';

import 'account_list_page.dart';

class AccountStatementPage extends StatefulWidget {
  @override
  _AccountStatementState createState() => _AccountStatementState();
}

class _AccountStatementState extends State<AccountStatementPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: Border(bottom: BorderSide(color: Color(0xFF1C65B9), width: 0)),
          toolbarHeight: ScreenUtil().setHeight(40),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRouteWithoutAnimation(
                  builder: (context) => AccountListPage(),
                ),
              );
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: ScreenUtil().setSp(30),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            '거래내역조회',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
          backgroundColor: Color(0xFF1C65B9),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Color(0xFF1C65B9),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(18),
                      ),
                      Text(
                        'WON 통장',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(18),
                      ),
                      Text(
                        '1002-123-456789',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '100,000 원',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(40),
              color: Color(0xFFF9F9F9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_left,
                      color: Color(0xFF5E5E5E),
                      size: ScreenUtil().setSp(26),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  Text(
                    '2021.09',
                    style: TextStyle(
                        color: Color(0xFF5E5E5E),
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right,
                      color: Color(0xFF5E5E5E),
                      size: ScreenUtil().setSp(26),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '05.23',
                              style: TextStyle(
                                color: Color(0xFF3A3A3A),
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '카카오법인택시',
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5),
                            ),
                            Text(
                              '체크카드',
                              style: TextStyle(
                                color: Color(0xFF747474),
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '+37,000 원',
                              style: TextStyle(
                                color: Color(0xFF3297F7),
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding: EdgeInsets.fromLTRB(
                          ScreenUtil().setSp(14),
                          ScreenUtil().setSp(10),
                          ScreenUtil().setSp(14),
                          ScreenUtil().setSp(12)),
                      fixedSize:
                          Size(double.infinity, ScreenUtil().setHeight(70)),
                      primary: Colors.white, // background
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRouteWithoutAnimation(
            builder: (context) => AccountListPage(),
          ),
        );
        return true;
      },
    );
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
