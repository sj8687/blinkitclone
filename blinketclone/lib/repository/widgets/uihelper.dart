import 'package:flutter/material.dart';

class UiHelper {
  static CustomImage({ required String img,

  double? width,
  double? height,

  BoxFit fit = BoxFit.contain,}) {
    return Image.asset("assets/images/$img", width: width,
    height: height,

    fit: fit,);
  }

  static CustomText({
    required String text,
    required Color color,
    required FontWeight fontWeight,
    String? fontFamily,
    required double fontsize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontFamily ?? "regular",
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
