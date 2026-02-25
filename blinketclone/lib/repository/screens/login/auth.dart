import 'dart:convert';
import 'package:blinketclone/constants/appcolors.dart';
import 'package:blinketclone/repository/screens/home/homescreen.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BlinkitLoginscreen extends StatefulWidget {
  const BlinkitLoginscreen({Key? key}) : super(key: key);

  @override
  State<BlinkitLoginscreen> createState() => _BlinkitLoginPageState();
}

class _BlinkitLoginPageState extends State<BlinkitLoginscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final storage = FlutterSecureStorage();

  Future<void> loginUser(String email, String password) async {
    debugPrint("Email:$email");
    debugPrint("Password:$password");

    //Navigator.push(
    //context,
    //MaterialPageRoute(builder:(context)=>BottomNavscreen()),
    //);

    final url = Uri.parse('http://localhost:3000/auth/signup');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // await storage.write(key:'jwt',value:data['token'],);

        print("Login Successful:$data");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homescreen()),
        );

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login Successful")));
        
      } else {
        final error = jsonDecode(response.body);
        print("Login Failed:${error['message']}");
      }
    } catch (e) {
      print("Login Error:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  UiHelper.CustomImage(
                    img: "logoblink.png",
                    width: 120.w,
                    height: 120.h,
                  ),

                  SizedBox(height: 10.h),

                  UiHelper.CustomText(
                    text: "India’s last minute app",
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w500,
                    fontsize: 16.sp,
                  ),
                ],
              ),

              ///Login Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(blurRadius: 10.r, color: Colors.black12),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    UiHelper.CustomText(
                      text: "Login",
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontsize: 22.sp,
                    ),

                    SizedBox(height: 20.h),
                    SizedBox(height: 50.h,

                      child: TextField(
                        controller: emailController,
                        style: TextStyle(fontSize: 14.sp),

                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          hintStyle: TextStyle(fontSize: 14.sp),
                          prefixIcon: Icon(Icons.email_outlined, size: 20.sp),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    SizedBox(
                      height: 50.h,

                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(fontSize: 14.sp),

                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: TextStyle(fontSize: 14.sp),
                          prefixIcon: Icon(Icons.lock_outline, size: 20.sp),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25.h),

                    SizedBox(
                      width: double.infinity,
                      height: 50.h,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),

                        onPressed: () {
                          loginUser(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },

                        child: UiHelper.CustomText(
                          text: "Login",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontsize: 16.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    Center(
                      child: UiHelper.CustomText(
                        text: "Forgot Password?",
                        color: AppColors.scaffoldBackgroundColor,
                        fontWeight: FontWeight.w600,
                        fontsize: 14.sp,
                      ),
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
