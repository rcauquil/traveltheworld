import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
 final Color color;
 final Widget widget;

 PlaceholderWidget(this.color, this.widget);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
     child: Center(
       child: widget
     ),
   );
 }
}