import 'package:flutter/material.dart';
import 'package:myhealthy/utils/colors.dart';
import 'package:myhealthy/widgets/appbar.dart';
import 'package:sizer/sizer.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: myAppbar(
                titleColor: red1,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 7.0.w,
                    color: red1,
                  ),
                ),
                trailing: SizedBox.shrink(),
                title: "Nueva comida"),
          ),
          Container(
            width: 90.0.w,
            height: 42.0.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "assets/plato.png",
                  width: 100.0.w,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 40.0.w,
                            height: 18.0.h,
                            color: Colors.purple.withOpacity(0.2),
                            child: Text("a")),
                        Container(
                            width: 40.0.w,
                            height: 18.0.h,
                            color: Colors.green.withOpacity(0.2),
                            child: Text("a")),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 40.0.w,
                            height: 18.0.h,
                            color: Colors.yellow.withOpacity(0.2),
                            child: Text("a")),
                        Container(
                            width: 40.0.w,
                            height: 18.0.h,
                            color: Colors.orange.withOpacity(0.2),
                            child: Text("a")),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
