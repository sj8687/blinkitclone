import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w), 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r), 
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
            ),
          ),
          SizedBox(height: 8.h), 
          Text(
            "Fresh Apples",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp, 
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "1 kg",
            style: TextStyle(
              fontSize: 12.sp, 
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹120",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp, 
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(60.w, 30.h), 
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  "ADD",
                  style: TextStyle(fontSize: 12.sp), 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}