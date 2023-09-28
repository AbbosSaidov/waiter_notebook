import 'package:flutter/material.dart';

class AnimateRoute {
  AnimateRoute._();
  static Route createRoute(confirmPage, {int animeDuration = 500,bool withoutAnimation=false}){
    if(withoutAnimation){
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => confirmPage,);
    }else{
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => confirmPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child){
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: animeDuration));
    }
  }
}
