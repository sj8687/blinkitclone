import 'package:blinketclone/repository/screens/login/auth.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

             
              UiHelper.CustomImage(
                img: "Blinkit Onboarding Screen.png",
                width: 250.w,
                height: 250.h,
              ),

             
              Column(
                children: [

                  UiHelper.CustomImage(
                    img: "blinkit-logo-vector_logoshape.png",
                    width: 90.w,
                    height: 120.h,
                  ),

                  SizedBox(height: 10.h),

                  UiHelper.CustomText(
                    text: "India’s last minute app",
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.bold,
                    fontsize: 18.sp,
                    fontFamily: "bold",
                  ),

                ],
              ),

             
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 15.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.r,
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Column(
                  children: [

                    UiHelper.CustomText(
                      text: "Shreyash",
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.w500,
                      fontsize: 13.sp,
                    ),

                    SizedBox(height: 4.h),

                    UiHelper.CustomText(
                      text: "9067xxx214",
                      color: Color(0XFF9C9C9C),
                      fontWeight: FontWeight.bold,
                      fontsize: 13.sp,
                      fontFamily: "bold",
                    ),

                    SizedBox(height: 18.h),

                    SizedBox(
                      height: 45.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlinkitLoginscreen(),
                            ),
                          );

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFE23744),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.r),
                          ),
                        ),
                        child: UiHelper.CustomText(
                          text: "Login",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontsize: 14.sp,
                          fontFamily: "bold",
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    UiHelper.CustomText(
                      text:
                          "Access your saved addresses from Zomato automatically!",
                      color: Color(0XFF9C9C9C),
                      fontWeight: FontWeight.normal,
                      fontsize: 9.sp,
                    ),

                    SizedBox(height: 15.h),

                    UiHelper.CustomText(
                      text: "or login with phone number",
                      color: Color(0XFF35821F),
                      fontWeight: FontWeight.normal,
                      fontsize: 13.sp,
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}