import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Colors.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final String hintText;
  final bool isPasswordVisible;
  final Function(bool isPasswordVisible)? isPasswordVisibleTap;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    this.isPasswordVisibleTap,
    this.isPasswordVisible = false,
    this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late bool suffixIconColor;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    suffixIconColor = false; // Default color
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      suffixIconColor = _focusNode.hasFocus ;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hintText,
          style: TextStyle(
          color: suffixIconColor? MyColors.whiteText : MyColors.notActiveText,
          fontSize: 16.h,
          fontFamily: 'sf',
        ),),
        SizedBox(height: 6.h,),
        Container(
          color: MyColors.listLight,
          height: 50.h,
          width: 331.w,
          child: TextField(
            focusNode:_focusNode ,
            controller: widget.controller,
            obscureText:widget.isPassword? !widget.isPasswordVisible:false,
            style: TextStyle(
              color: MyColors.whiteText,
              fontSize: 16.h,
              fontFamily: 'sf',
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.listLight),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.activeTextLight),
                borderRadius: BorderRadius.circular(10.r),
              ),
              // Additional logic for suffix icon in case of password field
              suffixIcon: widget.isPassword
                  ? InkWell(
                      child: Icon(
                        widget.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: suffixIconColor? MyColors.activeTextLight : MyColors.notActiveText,
                      ),
                      splashColor: Colors.transparent,
                      onTap: () {
                        widget.isPasswordVisibleTap!(widget.isPasswordVisible);
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
