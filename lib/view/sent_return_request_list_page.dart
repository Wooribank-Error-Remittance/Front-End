import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_button/slide_button.dart';

import 'account_list_page.dart';

class SentReturnRequestListPage extends StatefulWidget {
  @override
  _SentReturnRequestListState createState() => _SentReturnRequestListState();
}

class _SentReturnRequestListState extends State<SentReturnRequestListPage> {
  List<String> tempList = ['1', '2,' '3'];
  var textEditingControllers = <TextEditingController>[];

  @override
  void initState() {
    tempList.forEach((String str) {
      var textEditingController = new TextEditingController();
      textEditingControllers.add(textEditingController);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
              color: Colors.black87,
              size: ScreenUtil().setSp(30),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            '보낸 요청 목록',
            style: TextStyle(
              color: Colors.black87,
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
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
                          Theme(
                            data: theme,
                            child: ExpansionTile(
                              title: Container(
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
                                          '김도둑',
                                          style: TextStyle(
                                            color: Color(0xFFA7A7A7),
                                            fontSize: ScreenUtil().setSp(12),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Text(
                                          '1002-123-45678',
                                          style: TextStyle(
                                            color: Color(0xFF3A3A3A),
                                            fontSize: ScreenUtil().setSp(15),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              children: [
                                Container(
                                  height: ScreenUtil().setHeight(50),
                                  color: Color(0xFFDEECFF),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: ScreenUtil().setWidth(20),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '2021. 06. 28 월요일',
                                            style: TextStyle(
                                              color: Color(0xFFA7A7A7),
                                              fontSize: ScreenUtil().setSp(12),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenUtil().setHeight(5),
                                          ),
                                          Text(
                                            '10,000원',
                                            style: TextStyle(
                                              color: Color(0xFF3A3A3A),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: ScreenUtil().setHeight(28),
                                            width: ScreenUtil().setWidth(28),
                                            child: ElevatedButton(
                                              onPressed: null,
                                              child: Image.asset(
                                                  'assets/icons/report_red.png'),
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(0),
                                                onSurface: Color(0xFFDEECFF),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '신고하기',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(8),
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(10),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
            Center(
              child: SizedBox(
                height: ScreenUtil().setHeight(20),
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
