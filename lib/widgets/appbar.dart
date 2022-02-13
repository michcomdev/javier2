import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

Widget myAppbar(
    {required Widget leading,
    required Widget trailing,
    required String title,
    required Color titleColor
    // required Widget subtitle
    }) {
  return Container(
    width: 100.0.w,
    height: 18.0.h,
    child: Column(
      children: [
        SizedBox(height: 5.0.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [leading, trailing],
        ),
        SizedBox(height: 2.0.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // leading,
            Text(
              title,
              style: TextStyle(
                  color: titleColor,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
