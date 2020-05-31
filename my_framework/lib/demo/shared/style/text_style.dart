import 'package:flutter/material.dart';
import '../../config/app_color_config.dart';


class TxtStyle {
  static TextStyle normal() {
    return TextStyle(fontSize: 16, color: AppColor.blueMain);
  }

  static TextStyle bookCategoryHeaderStyle = TextStyle(
    color: Colors.black87,
    decoration: TextDecoration.none,
    fontSize: 16,
  );
  static TextStyle bookSeeAllStyle = TextStyle(
    color: AppColor.textBlue,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  static TextStyle bookNameStyle = TextStyle(
    color: AppColor.textBlack,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
  static TextStyle authorNameStyleHome = TextStyle(
    color: AppColor.textBlack,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
    fontSize: 9,
  );

  static TextStyle priceStyle = TextStyle(
    color: AppColor.textBlue,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
  static TextStyle priceBoldStyle = TextStyle(
    color: AppColor.textBlue,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static TextStyle priceNormalStyle = TextStyle(
    color: AppColor.textBlue,
    decoration: TextDecoration.none,
    fontSize: 12,
  );

  static TextStyle smallItalicStyle =
      TextStyle(decoration: TextDecoration.none, fontSize: 10, fontStyle: FontStyle.italic);
  static TextStyle smallItalicLineBottomStyle = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 10,
    fontStyle: FontStyle.italic,
  );
  static TextStyle partHeaderStyle =
      TextStyle(color: AppColor.textBlack, fontSize: 22, fontWeight: FontWeight.w600);

  static TextStyle tabHeaderStyle = TextStyle(color: AppColor.greyMain, fontSize: 13);
  static TextStyle tabHeaderStyleSelected = TextStyle(color: AppColor.blueMain, fontSize: 13);
}
