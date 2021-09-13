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
          children: <Widget>[],
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
