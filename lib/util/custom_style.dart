import 'package:flutter/material.dart';


class CustomText {

  static textF18W600TextColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
  static textF18W600PrimaryColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
  static textF18W700WhiteColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
  static textF24W700PrimaryColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 24,
       
        fontWeight: FontWeight.w700,
      ),
    );
  }
  static textF14W400TextColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 14,
       
        fontWeight: FontWeight.w400,
      ),
    );
  }
  static textF16W600TextColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 16,
       
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static textF16W700White(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
  static textF32W700PrimaryColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 32,
       
        fontWeight: FontWeight.w700,
      ),
    );
  }
  static textF12W400Gray(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 12,
        
        fontWeight: FontWeight.w500,
      ),
    );
  }
  static textF12W400White(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static textF12W500TextColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 12,
       
        fontWeight: FontWeight.w500,
      ),
    );
  }
  static textF12W700TextColor(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 12,
       
        fontWeight: FontWeight.w700,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  static textF14W400Gray(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 14,
        
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static textRegular({required String text, Color? color, FontWeight? fontWeight, double? fontSize, TextAlign? textAlign, int? maxLines}) {
    return Text(text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign?? TextAlign.start,
      style: TextStyle(
        fontSize: fontSize?? 14,
        fontWeight: fontWeight?? FontWeight.w400,
      ),
    );
  }
  static textMedium({required String text, Color? color, FontWeight? fontWeight, double? fontSize, TextAlign? textAlign}) {
    return Text(text,
      textAlign: textAlign?? TextAlign.start,
      style: TextStyle(
        fontSize: fontSize?? 16,
        fontWeight:fontWeight?? FontWeight.w700,

      ),
    );
  }
  static textLarge({required String text, Color? color, FontWeight? fontWeight, double? fontSize}) {
    return Text(text,
      style: TextStyle(
        fontSize: 20,
       
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
