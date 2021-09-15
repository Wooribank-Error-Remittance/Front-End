import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wooribank_error_remittance/view/first_page.dart';

import 'account_list_page.dart';

class ReportListPage extends StatefulWidget {

  final String userId;
  final String password;
  final String name;

  ReportListPage(
      {required this.userId, required this.password, required this.name});

  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportListPage> {

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRouteWithoutAnimation(
                  builder: (context) => AccountListPage(userId: widget.userId,
                    password: widget.password,
                    name: widget.name,),
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
            '신고건 목록',
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
            Container(
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
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
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fixedSize: Size(ScreenUtil().setWidth(260),
                                    ScreenUtil().setHeight(80)),
                                primary: Color(0xFFFF766D),
                              ),
                              onPressed: () {},
                              child: Text(''),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
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
            builder: (context) => AccountListPage(userId: widget.userId,
              password: widget.password,
              name: widget.name,),
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
