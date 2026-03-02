import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["Fruits", "Dairy", "Snacks", "Beverages", "Bakery"];

    return SizedBox(
      height: 80.h, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: categories.length,
        itemBuilder: (_, index) {
          return Container(
            width: 70.w, 
            margin: EdgeInsets.only(right: 12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                CircleAvatar(
                  radius: 25.r, // smaller radius
                  backgroundColor: Colors.yellow[100],
                ),
                SizedBox(height: 4.h),
                FittedBox(
                  fit: BoxFit.scaleDown, 
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}