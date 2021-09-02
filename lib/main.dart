import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wooribank_error_remittance/view/first_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: '우리은행 착오송금 반환서비스',
        theme: ThemeData( ),
        home: FirstPage(),
      ),
    );
  }
}
