
import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/style/text_style.dart';


class CustomTextField extends StatefulWidget {
  final hintText;
  final FormFieldValidator<String> validator;
  final Function onChange;
  final TextStyle style;

  CustomTextField({this.hintText, this.validator,this.onChange, this.style});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange ,
      style:  widget.style,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: AppTextStyle.montserratRegular,
          fillColor: Colors.white,
          filled: true,
          
          ),
      validator: widget.validator,
      keyboardType: TextInputType.multiline,
       maxLines: null
    );
  }
}

