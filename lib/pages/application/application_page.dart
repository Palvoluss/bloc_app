import 'package:bloc_app/pages/application/widgets/application_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _index = value;
              });
              print(_index);
            },
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                label: "home",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: "search",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
