import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/pages/home/bloc/home_page_blocs.dart';
import 'package:bloc_app/pages/home/bloc/home_page_events.dart';
import 'package:bloc_app/pages/home/bloc/home_page_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/person.png"),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int topMargin = 20}) {
  return Container(
    margin: EdgeInsets.only(top: topMargin.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 220.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  hintText: "search something",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                autocorrect: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.h),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget sliderView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/icons/art.png"),
            _slidersContainer(path: "assets/icons/image(3).png"),
            _slidersContainer(path: "assets/icons/image(4).png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index.toInt(),
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _reusableText("choose one"),
            GestureDetector(
              child: _reusableText("see all",
                  color: AppColors.primaryThreeElementText, fontSize: 10),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText("all"),
            _reusableMenuText(
              "popular",
              textColor: AppColors.primaryThreeElementText,
              backgroundColor: Colors.white,
            ),
            _reusableMenuText(
              "newest",
              textColor: AppColors.primaryThreeElementText,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      )
    ],
  );
}

Widget _reusableText(String text,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}

Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backgroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: backgroundColor),
    ),
    padding: EdgeInsets.only(
      left: 15.w,
      right: 15.w,
      top: 5.h,
      bottom: 5.h,
    ),
    child: _reusableText(
      menuText,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/icons/image(3).png"),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "best course",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "best course for true",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourElementText,
            fontWeight: FontWeight.normal,
            fontSize: 8.sp,
          ),
        ),
      ],
    ),
  );
}
