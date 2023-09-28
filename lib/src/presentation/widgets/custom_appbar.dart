import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool withBack;
  final String title;
  final Function? onTapBack;
  const CustomAppBar({Key? key, this.withBack = false, this.title = "", this.onTapBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363.w,
      height: 48.h,
      color: MyColors.appBarLight,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 44.h,
          child: Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              Material(
                shape: const CircleBorder(), // Add this for rounded shape
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: withBack
                    ? IconButton(
                        onPressed: () {
                          if (onTapBack == null) {
                            Navigator.pop(context);
                          } else {
                            onTapBack!();
                          }
                        },
                        icon: SizedBox(
                          height: 24.h,
                          width: 33.w,
                          child: Image.asset(
                            'assets/icons/Left circle.png',
                            color: MyColors.blackText,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 24.h,
                        width: 33.w,
                      ),
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                height: 22.w,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: MyColors.blackText,
                    fontFamily: "sf",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(88.h);
}
