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
            Center(
              child: Container(
                width: 300,
                height: 80,
                child: SlideButton(
                  backgroundChild: Center(child: Text('테스트')),
                  backgroundColor: Color(0xFF3297F7),
                  slidingChild: ElevatedButton(
                    style: ElevatedButton.styleFrom(
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
                    child: FittedBox(
                      child: Text(
                        textEditingControllers[1].text,
                        overflow: TextOverflow.ellipsis,
                      ),
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
