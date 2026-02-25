import 'package:blinketclone/constants/appcolors.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 45),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.CustomText(
                    text: "Blinkit in",
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "bold",
                    fontsize: 14,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UiHelper.CustomText(
                        text: "16 minutes",
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "extrabolditalic",
                        fontsize: 20,
                      ),

                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      UiHelper.CustomText(
                        text: "HOME -",
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "bold",
                        fontsize: 18,
                      ),
                      UiHelper.CustomText(
                        text: " Shreyash, Maharastra, baramati",
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.normal,
                        fontFamily: "",
                        fontsize: 17,
                      ),
                      SizedBox(width: 10),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 22,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
