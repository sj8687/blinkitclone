import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

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
    TextAlign textAlign = TextAlign.start
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontFamily ?? "regular",
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }


  static productCard({
    required String image,
    required String name,
    required String price,
  }) {
    return Container(
      width: 100.w,

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Stack(
            children: [

              UiHelper.CustomImage(
                img: image,
                width: 100.w,
                height: 100.h,
              ),

              Positioned(
                bottom: 5.h,
                right: 5.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.green),
                    borderRadius:
                        BorderRadius.circular(
                            6.r),
                  ),
                  child: UiHelper.CustomText(
                    text: "ADD",
                    color: Colors.green,
                    fontWeight:
                        FontWeight.bold,
                    fontsize: 10.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 5.h),

          UiHelper.CustomText(
            text: name,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontsize: 12.sp,
          ),

          UiHelper.CustomText(
            text: "₹ $price",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontsize: 14.sp,
          ),
        ],
      ),
    );
  }
}

