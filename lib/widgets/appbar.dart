import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myhealthy/utils/colors.dart';
import 'package:sizer/sizer.dart';

Widget myAppbar(Widget leading, Widget trailing, String title) {
  return Container(
    width: 100.0.w,
    height: 20.0.h,
    child: Column(
      children: [
        SizedBox(height: 5.0.h),
        Row(
          children: [
            leading,
            Text(
              title,
              style: TextStyle(
                  color: red5, fontSize: 20.0.sp, fontWeight: FontWeight.bold),
            ),
            trailing
          ],
        ),
      ],
    ),
  );
}
