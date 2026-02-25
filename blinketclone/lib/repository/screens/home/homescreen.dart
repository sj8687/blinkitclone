import 'package:blinketclone/constants/appcolors.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BlinkitHomescreen extends StatefulWidget {
  const BlinkitHomescreen({Key? key}) : super(key: key);

  @override
  State<BlinkitHomescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<BlinkitHomescreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 20.h,
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 34, 83),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiHelper.CustomText(
                          text: "Blinkit in",
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "bold",
                          fontsize: 14.sp,
                        ),

                        UiHelper.CustomText(
                          text: "16 minutes",
                          color:  Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "extrabolditalic",
                          fontsize: 20.sp,
                        ),

                        SizedBox(height: 4.h),

                        UiHelper.CustomText(
                          text: "HOME - shreyash, Maharastra",
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontsize: 12.sp,
                        ),
                      ],
                    ),

                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 20.sp),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),

                  child: Row(
                    children: [
                      Icon(Icons.search),

                      SizedBox(width: 10.w),

                      Expanded(
                        child: TextField(
                          controller: searchController,

                          decoration: InputDecoration(
                            hintText: "Search 'ice-cream'",
                            border: InputBorder.none,
                          ),

                          onSubmitted: (value) {
                            print("User searched: $value");
                          },
                        ),
                      ),

                      IconButton(
                        icon: Icon(Icons.mic),
                        onPressed: () {
                          print("User searched: ${searchController.text}");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  Center(
                    child: UiHelper.CustomImage(
                      img: "shopping-cart.png",
                      width: 150.w,
                      height: 150.h,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Center(
                    child: UiHelper.CustomText(
                      text: "Reordering will be easy",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "bold",
                      fontsize: 18.sp,
                    ),
                  ),

                  SizedBox(height: 5.h),

                  Center(
                    child: UiHelper.CustomText(
                      text:
                          "Items you order will show up here so you can buy them again easily.",
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontsize: 12.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  UiHelper.CustomText(
                    text: "Bestsellers",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontsize: 18.sp,
                  ),

                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UiHelper.productCard(
                        image: "milk.png",
                        name: "Fresh Milk",
                        price: "27",
                      ),

                      UiHelper.productCard(
                        image: "potato.png",
                        name: "Potato",
                        price: "37",
                      ),

                      UiHelper.productCard(
                        image: "tomato.png",
                        name: "Tomato",
                        price: "37",
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
