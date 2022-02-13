import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthy/widgets/appbar.dart';
import 'package:sizer/sizer.dart';

class RecipeDetails extends StatefulWidget {
  final data;
  final Color color;
  RecipeDetails(this.data, this.color);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: myAppbar(
                titleColor: Colors.white,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 7.0.w,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                title: widget.data["Nombre"]),
          ),
          SizedBox(
            height: 1.0.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 7.0.h,
                  ),
                  Expanded(
                    child: Container(
                      width: 100.0.w,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ingredientes",
                                  style: TextStyle(
                                      color: widget.color,
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 30.0.w,
                                  height: 5.0.h,
                                  child: Center(
                                    child: Text(
                                      widget.data["Tiempo"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: widget.color,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50))),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                widget.data["Ingredientes"],
                                style: TextStyle(
                                    color: widget.color, fontSize: 14.0.sp),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            Text(
                              "Dificultad",
                              style: TextStyle(
                                  color: widget.color,
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.sentiment_satisfied_alt_sharp,
                                      color: widget.data["Dificultad"] == "baja"
                                          ? widget.color
                                          : Colors.grey,
                                      size: 13.0.w,
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Text(
                                      "Baja",
                                      style: TextStyle(
                                          color: widget.data["Dificultad"] ==
                                                  "baja"
                                              ? widget.color
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0.sp),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.sentiment_neutral_outlined,
                                      color:
                                          widget.data["Dificultad"] == "media"
                                              ? widget.color
                                              : Colors.grey,
                                      size: 13.0.w,
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Text(
                                      "Media",
                                      style: TextStyle(
                                          color: widget.data["Dificultad"] ==
                                                  "media"
                                              ? widget.color
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0.sp),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.sentiment_very_dissatisfied_sharp,
                                      color: widget.data["Dificultad"] == "alta"
                                          ? widget.color
                                          : Colors.grey,
                                      size: 13.0.w,
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Text(
                                      "Alta",
                                      style: TextStyle(
                                          color: widget.data["Dificultad"] ==
                                                  "alta"
                                              ? widget.color
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0.sp),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/desayuno.png"),
                    radius: 20.0.w,
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
