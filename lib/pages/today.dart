import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myhealthy/pages/recipe_details.dart';
import 'package:myhealthy/testing/data.dart';
import 'package:myhealthy/utils/colors.dart';
import 'package:myhealthy/widgets/appbar.dart';
import 'package:sizer/sizer.dart';

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myAppbar(
          titleColor: red1,
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/desayuno.png"),
          ),
          trailing: Text(
            StringUtils.capitalize(
                DateFormat.EEEE("es_ES").format(today) + " ${today.day}"),
            style: TextStyle(
                color: red4, fontSize: 14.0.sp, fontWeight: FontWeight.bold),
          ),
          title: "Hola, Gisela",
          // subtitle: Text(
          //   StringUtils.capitalize(
          //       DateFormat.EEEE("es_ES").format(today) + " ${today.day}"),
          //   style: TextStyle(color: red4, fontSize: 14.0.sp),
          // ),
        ),
        Center(
            child: Container(
                decoration: BoxDecoration(
                    color: redlight5.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                width: 90.0.w,
                height: 6.0.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 13.0.sp, color: red2),
                        prefixIcon:
                            Icon(Icons.search, size: 7.0.w, color: red2),
                        border: InputBorder.none,
                        hintText: "Buscar"),
                  ),
                ))),
        SizedBox(
          height: 5.0.h,
        ),
        Text(
          "Comidas del día",
          style: TextStyle(
              color: red5, fontSize: 20.0.sp, fontWeight: FontWeight.bold),
        ),
        // Text(
        //   "Tu menú para hoy es:",
        //   style: TextStyle(color: red4, fontSize: 18.0.sp),
        // ),
        Container(
            width: 100.0.w,
            height: 40.0.h,
            child: ListView(
              physics: ScrollPhysics(parent: BouncingScrollPhysics()),
              scrollDirection: Axis.horizontal,
              children: [
                item("Desayuno", Colors.green, recipes[100]["Nombre"],
                    "assets/desayuno.png", recipes[100]),
                item("Almuerzo", Colors.blue, recipes[20]["Nombre"],
                    "assets/almuerzo.png", recipes[20]),
                item("Snack", Colors.orange, recipes[30]["Nombre"],
                    "assets/snack.png", recipes[30]),
                item("Cena", Colors.purple, recipes[50]["Nombre"],
                    "assets/cena.png", recipes[50]),
              ],
            ))
      ],
    );
  }

  Widget item(String title, Color color, String name, String asset, var data) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            width: 50.0.w,
            height: 30.0.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 17.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 16.0.sp, color: color),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                                color.withOpacity(0.3))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      RecipeDetails(data, color)));
                        },
                        icon: Text(
                          "Ver",
                          style: TextStyle(color: color.withOpacity(0.9)),
                        ),
                        label: Icon(Icons.arrow_forward,
                            color: color.withOpacity(0.9))),
                    SizedBox(
                      width: 4.0.w,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(asset),
          ),
          radius: 15.0.w,
        ),
      ],
    );
  }
}
