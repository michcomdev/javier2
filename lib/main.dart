import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myhealthy/pages/homepage.dart';
import 'package:myhealthy/utils/colors.dart';
import 'package:sizer/sizer.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (ctx, orientation, type) {
        return MaterialApp(
            title: 'Healthy',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: red3),
            home: HomePage());
      },
    );
  }
}
