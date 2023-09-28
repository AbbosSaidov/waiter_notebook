import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';

class CommonButtonWidget extends StatefulWidget {
  const CommonButtonWidget(
      {Key? key, this.title, this.onTaps, this.colorOfButton, this.titleColor, this.isLoading = false})
      : super(key: key);

  final String? title;
  final Function? onTaps;
  final Color? colorOfButton, titleColor;
  final bool? isLoading;
  @override
  _CommonButtonWidgetState createState() => _CommonButtonWidgetState();
}

class _CommonButtonWidgetState extends State<CommonButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        color: widget.colorOfButton,
        child: InkWell(
          onTap: () {
            if (widget.onTaps != null) {
              widget.onTaps!();
            }
          },
          child: SizedBox(
            height: 49.h,
            width: 331.w,
            child: Center(
              child: Text(
                widget.title ?? "",
                style: TextStyle(fontSize: 18.h, fontFamily: "sfBold", color: widget.titleColor ?? MyColors.whiteText),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
