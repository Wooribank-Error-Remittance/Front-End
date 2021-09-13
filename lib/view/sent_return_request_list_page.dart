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
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
              fontSize: ScreenUtil().setSp(18),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Text(
                    '6.28\n\n\n',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(100),
                    child: VerticalDivider(
                      color: Colors.grey,
                      width: ScreenUtil().setWidth(5),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Center(
                    child: Container(
                      width: ScreenUtil().setWidth(260),
                      height: ScreenUtil().setHeight(80),
                      child: SlideButton(
                        backgroundChild: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            fixedSize: Size(ScreenUtil().setWidth(260),
                                ScreenUtil().setHeight(80)),
                            primary: Color(0xFF3297F7),
                          ),
                          onPressed: () {},
                          child: Text(''),
                        ),
                        backgroundColor: Colors.transparent,
                        slidingChild: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Color(0xFFFF766D),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRouteWithoutAnimation(
                                builder: (context) => AccountListPage(),
                              ),
                            );
                          },
                          child: Text(
                            textEditingControllers[1].text,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        onButtonOpened: () {
                          setState(() {
                            textEditingControllers[1].text = "신고하기";
                          });
                        },
                        onButtonClosed: () {
                          WidgetsBinding.instance!
                              .addPostFrameCallback((_) => setState(() {
                                    textEditingControllers[1].text = " ";
                                  }));
                        },
                        slideDirection: SlideDirection.LEFT,
                        initialSliderPercentage: 0.14,
                        confirmPercentage: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Text(
                    '6.28\n\n\n',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(100),
                    child: VerticalDivider(
                      color: Colors.grey,
                      width: ScreenUtil().setWidth(5),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Center(
                    child: Container(
                      width: ScreenUtil().setWidth(260),
                      height: ScreenUtil().setHeight(80),
                      child: SlideButton(
                        backgroundChild: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            fixedSize: Size(ScreenUtil().setWidth(260),
                                ScreenUtil().setHeight(80)),
                            primary: Color(0xFF3297F7),
                          ),
                          onPressed: () {},
                          child: Text(''),
                        ),
                        backgroundColor: Colors.transparent,
                        slidingChild: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Color(0xFFFF766D),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRouteWithoutAnimation(
                                builder: (context) => AccountListPage(),
                              ),
                            );
                          },
                          child: Text(
                            textEditingControllers[1].text,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        onButtonOpened: () {
                          setState(() {
                            textEditingControllers[1].text = "신고하기";
                          });
                        },
                        onButtonClosed: () {
                          WidgetsBinding.instance!
                              .addPostFrameCallback((_) => setState(() {
                            textEditingControllers[1].text = " ";
                          }));
                        },
                        slideDirection: SlideDirection.LEFT,
                        initialSliderPercentage: 0.14,
                        confirmPercentage: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Text(
                    '6.28\n\n\n',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(100),
                    child: VerticalDivider(
                      color: Colors.grey,
                      width: ScreenUtil().setWidth(5),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Center(
                    child: Container(
                      width: ScreenUtil().setWidth(260),
                      height: ScreenUtil().setHeight(80),
                      child: SlideButton(
                        backgroundChild: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            fixedSize: Size(ScreenUtil().setWidth(260),
                                ScreenUtil().setHeight(80)),
                            primary: Color(0xFF3297F7),
                          ),
                          onPressed: () {},
                          child: Text(''),
                        ),
                        backgroundColor: Colors.transparent,
                        slidingChild: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Color(0xFFFF766D),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRouteWithoutAnimation(
                                builder: (context) => AccountListPage(),
                              ),
                            );
                          },
                          child: Text(
                            textEditingControllers[1].text,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        onButtonOpened: () {
                          setState(() {
                            textEditingControllers[1].text = "신고하기";
                          });
                        },
                        onButtonClosed: () {
                          WidgetsBinding.instance!
                              .addPostFrameCallback((_) => setState(() {
                            textEditingControllers[1].text = " ";
                          }));
                        },
                        slideDirection: SlideDirection.LEFT,
                        initialSliderPercentage: 0.14,
                        confirmPercentage: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Text(
                    '6.28\n\n\n',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(100),
                    child: VerticalDivider(
                      color: Colors.grey,
                      width: ScreenUtil().setWidth(5),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Center(
                    child: Container(
                      width: ScreenUtil().setWidth(260),
                      height: ScreenUtil().setHeight(80),
                      child: SlideButton(
                        backgroundChild: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            fixedSize: Size(ScreenUtil().setWidth(260),
                                ScreenUtil().setHeight(80)),
                            primary: Color(0xFF3297F7),
                          ),
                          onPressed: () {},
                          child: Text(''),
                        ),
                        backgroundColor: Colors.transparent,
                        slidingChild: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Color(0xFFFF766D),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRouteWithoutAnimation(
                                builder: (context) => AccountListPage(),
                              ),
                            );
                          },
                          child: Text(
                            textEditingControllers[1].text,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        onButtonOpened: () {
                          setState(() {
                            textEditingControllers[1].text = "신고하기";
                          });
                        },
                        onButtonClosed: () {
                          WidgetsBinding.instance!
                              .addPostFrameCallback((_) => setState(() {
                            textEditingControllers[1].text = " ";
                          }));
                        },
                        slideDirection: SlideDirection.LEFT,
                        initialSliderPercentage: 0.14,
                        confirmPercentage: 0.5,
                      ),
                    ),
                  ),
                ],
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
