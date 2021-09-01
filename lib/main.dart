import 'package:flutter/material.dart';
import 'package:wooribank_error_remittance/view/first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '우리은행 착오송금 반환서비스',
      theme: ThemeData(
      ),
      home: FirstPage(),
    );
  }
}
