import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:myhealthy/pages/calendar.dart';
import 'package:myhealthy/pages/profile.dart';
import 'package:myhealthy/pages/today.dart';
import 'package:myhealthy/utils/colors.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  Color unselectedColor = Colors.grey;

  final List<Widget> pages = [Today(), Calendar(), Profile()];

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        child: TabBar(
          indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: tabController,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: redlight3, width: 3)),
          tabs: [
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                  child: Icon(
                Icons.home_outlined,
                color: currentPage == 0 ? redlight3 : unselectedColor,
              )),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                  child: Icon(
                Icons.calendar_today_outlined,
                color: currentPage == 1 ? redlight3 : unselectedColor,
              )),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                  child: Icon(
                Icons.person_outlined,
                color: currentPage == 2 ? redlight3 : unselectedColor,
              )),
            ),
          ],
        ),
        fit: StackFit.expand,
        icon: Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: null,
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: unselectedColor,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(15),
        duration: Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: 80.0.w,
        barColor: Colors.white,
        start: 2,
        end: 0,
        bottom: 10,
        alignment: Alignment.bottomCenter,
        iconHeight: 35,
        iconWidth: 35,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: TabBarView(
              controller: tabController,
              dragStartBehavior: DragStartBehavior.down,
              physics: BouncingScrollPhysics(),
              children: pages),
        ),
      ),
    );
  }
}
