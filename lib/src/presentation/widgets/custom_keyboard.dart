import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';

class CustomKeyboardWidget extends StatefulWidget {
  CustomKeyboardWidget({
    Key? key,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
    required this.onTap5,
    required this.onTap6,
    required this.onTap7,
    required this.onTap8,
    required this.onTap9,
    required this.onTap0,
    required this.onTapRemove,
  }) : super(key: key);

  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;
  final GestureTapCallback onTap3;
  final GestureTapCallback onTap4;
  final GestureTapCallback onTap5;
  final GestureTapCallback onTap6;
  final GestureTapCallback onTap7;
  final GestureTapCallback onTap8;
  final GestureTapCallback onTap9;
  final GestureTapCallback onTap0;
  final GestureTapCallback onTapRemove;
  @override
  _CustomKeyboardWidgetState createState() => _CustomKeyboardWidgetState();
}

class _CustomKeyboardWidgetState extends State<CustomKeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.h,
      width: 340.h,
      child: Center(
        child: Wrap(
          spacing: 23.0.h, // gap between adjacent chips
          runSpacing: 8.5.h, // gap between lines
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                  splashColor: MyColors.backgroundLight.withOpacity(0.1),
                  onTap: widget.onTap1,
                  child: SizedBox(
                    height: 74.h,
                    width: 74.h,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/ellipse_icon.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap2,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap3,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "3",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap4,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "4",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap5,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "5",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap6,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "6",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap7,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "7",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap8,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "8",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap9,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "9",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            SizedBox(
              height: 74.h, width: 74.h,
              // child:Image.asset('assets/icons/ellipse_icon.png') ,
            ),
            ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(MyColors.whiteText.withOpacity(0.1)),
                      splashColor: MyColors.backgroundLight.withOpacity(0.1),
                      onTap: widget.onTap0,
                      child: SizedBox(
                        height: 74.h,
                        width: 74.h,
                        child: Container(
                          margin: const EdgeInsets.only(top: 4, right: 1, left: 1),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/ellipse_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "0",
                              style: TextStyle(fontSize: 32.h, fontFamily: "sf", color: MyColors.blackText),
                            ),
                          ),
                        ),
                      ),
                    ))),
            InkWell(
              onTap: widget.onTapRemove,
              child: SizedBox(
                height: 74.h,
                width: 74.h,
                child: Center(
                  child: Text(
                    "Удалить",
                    style: TextStyle(color: MyColors.blackText, fontSize: 19.h, fontFamily: "sf"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
