import 'package:flutter/material.dart';
import 'package:myhealthy/utils/colors.dart';
import 'package:myhealthy/widgets/appbar.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          myAppbar(
              titleColor: red1,
              leading: Icon(
                Icons.menu,
                color: red1,
                size: 7.0.w,
              ),
              trailing: SizedBox.shrink(),
              title: 'Recetas'),
        ]));
  }
}
