import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
 final Color color;
 final String text;

 PlaceholderWidget(this.color, this.text);

 @override
 Widget build(BuildContext context) {

   print('$color : $text');

   return Container(
     color: color,
     child: Center(
       child: Text(text)
     ),
   );
 }
}