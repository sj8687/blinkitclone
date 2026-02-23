import 'package:blinketclone/repository/screens/login/auth.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            UiHelper.CustomImage(img: "Blinkit Onboarding Screen.png"),
            SizedBox(height: 30),
            UiHelper.CustomImage(img: "image 10.png"),
            SizedBox(height: 20),
            UiHelper.CustomText(
              text: "India’s last minute app",
              color: Color(0XFF000000),
              fontWeight: FontWeight.bold,
              fontsize: 20,
              fontFamily: "bold",
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0XFFFFFFFF),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  UiHelper.CustomText(
                    text: "Shreyash",
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.w500,
                    fontsize: 14,
                  ),
                  SizedBox(height: 5),
                  UiHelper.CustomText(
                    text: "9067xxx214",
                    color: Color(0XFF9C9C9C),
                    fontWeight: FontWeight.bold,
                    fontsize: 14,
                    fontFamily: "bold",
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 48,
                    width: 295,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BlinkitLoginscreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFE23744),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiHelper.CustomText(
                            text: "Login",
                            color: Color(0XFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontsize: 14,
                            fontFamily: "bold",
                          ),
                          SizedBox(width: 5),
                          // UiHelper.CustomImage(img: "zomato.png"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  UiHelper.CustomText(
                    text:
                        "Access your saved addresses from Zomato automatically!",
                    color: Color(0XFF9C9C9C),
                    fontWeight: FontWeight.normal,
                    fontsize: 10,
                  ),

                  SizedBox(height: 20),
                  UiHelper.CustomText(
                    text: "or login with phone number",
                    color: Color.fromARGB(255, 53, 130, 31),
                    fontWeight: FontWeight.normal,
                    fontsize: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
