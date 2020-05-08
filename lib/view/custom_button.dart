import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  final Color color;
  final String text;
  final Function onTap;
  final TextStyle style;

  const CustomButton({ this.color, this.text, this.onTap, this.style});
  @override
  Widget build(BuildContext context) {
    return Container(
   width: MediaQuery.of(context).size.width,
   height: 40,
   child: FlatButton(
     textColor: color,
     shape: RoundedRectangleBorder(
         side:
             BorderSide(color: color, width: 2),
         borderRadius: BorderRadius.circular(4.0)),
     onPressed: 
      onTap,
     child: Text(
       text,
       style: style,
     ),
   ),
 );
  }
}
