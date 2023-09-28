import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';

class CustomBottomNavigationWidget extends StatefulWidget {
  const CustomBottomNavigationWidget(
      {Key? key, this.stateOFBottom = 0, required this.onTap1, required this.onTap2, required this.onTap3})
      : super(key: key);

  final int stateOFBottom;
  final Function onTap1;
  final Function onTap2;
  final Function onTap3;

  @override
  _CustomBottomNavigationWidgetState createState() => _CustomBottomNavigationWidgetState();
}

class _CustomBottomNavigationWidgetState extends State<CustomBottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.h,
      color: MyColors.appBarLight,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24.r),
                onTap: () {
                  if (widget.stateOFBottom != 0) {
                    widget.onTap1();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 18.h,
                        width: 33.w,
                        child: Image.asset(
                          'assets/icons/Union.png',
                          color: widget.stateOFBottom == 0 ? MyColors.activeTextLight : MyColors.notActiveTextLight,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('Столы',
                          style: TextStyle(
                              color: widget.stateOFBottom == 0 ? MyColors.activeTextLight : MyColors.notActiveTextLight))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24.r),
              onTap: () {
                if (widget.stateOFBottom != 1) {
                  widget.onTap2();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 18.h,
                      width: 16.w,
                      child: Image.asset(
                        'assets/icons/Document.png',
                        color: widget.stateOFBottom == 1 ? MyColors.activeTextLight : MyColors.notActiveTextLight,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Заказы',
                        style:
                            TextStyle(color: widget.stateOFBottom == 1 ? MyColors.activeTextLight : MyColors.notActiveTextLight))
                  ],
                ),
              ),
            ),
          )),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24.r),
                onTap: () {
                  if (widget.stateOFBottom != 2) {
                    widget.onTap3();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 18.h,
                        width: 15.w,
                        child: Image.asset('assets/icons/User.png',
                            color: widget.stateOFBottom == 2 ? MyColors.activeTextLight : MyColors.notActiveTextLight),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('Профиль',
                          style: TextStyle(
                              color: widget.stateOFBottom == 2 ? MyColors.activeTextLight : MyColors.notActiveTextLight))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
