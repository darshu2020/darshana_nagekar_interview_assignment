import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/style/color.dart';
import 'package:interview_test_darshana_nagekar/style/text_style.dart';

class IdWidgetClass {

  static Widget buildIdConatiner(String id, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: MediaQuery.of(context).size.width / 8,
      height: 20,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Text(
                '#' + id.toString(),
                style: AppTextStyle.montserratRegularIdText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
