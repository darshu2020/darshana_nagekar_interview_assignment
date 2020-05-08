import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/style/color.dart';


class AppTextStyle {
  AppTextStyle._();


// MontserratBold with font 16 and bold
  static TextStyle montserratBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: "Montserrat",
  );

static TextStyle montserratSemiBoldWithBlackText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: "Montserrat",
  );

  // MontserratRegular with font 16
  static TextStyle montserratRegularWhiteText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "Montserrat",
  );

  static TextStyle montserratRegularBlueText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color:AppColors.primaryColor,
    fontFamily: "Montserrat",
  );

static TextStyle montserratRegularRedText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    // color:Colors.,
    fontFamily: "Montserrat",
  );

  static TextStyle montserratRegularCancelText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color:AppColors.cancelColor,
    fontFamily: "Montserrat",
  );

  static TextStyle montserratRegularIdText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color:Colors.white,
    fontFamily: "Montserrat",
  );

  static TextStyle montserratRegularGreyText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color:AppColors.lightGreyColor,
    fontFamily: "Montserrat",
  );

// MontserratRegular with font 14
   static TextStyle montserratRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGreyColor,
    fontFamily: "Montserrat",
  );

  static TextStyle montserratSemibold = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: "Montserrat",
  );

    static TextStyle montserratSemiboldBlackText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: "Montserrat",
  );

  static TextStyle montserratRegularBlackText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: "Montserrat",
  );

    static TextStyle montserratLigthBlackText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w200,
    color:Colors.black,
    fontFamily: "Montserrat",
    );

    static TextStyle montserratLigthGreyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w100,
    color:AppColors.lightGreyColor,
    fontFamily: "Montserrat",
  );


}
