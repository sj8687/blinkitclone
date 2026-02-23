import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Container(
            height: 160,
            width: double.infinity,
            color: Color(0XFFF7CB45),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    UiHelper.CustomText(
                      text: "Blinkit in",
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.bold,
                      fontsize: 12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width:10),
                    UiHelper.CustomText(
                      text: "16 minutes",
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.bold,
                      fontsize: 14,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
