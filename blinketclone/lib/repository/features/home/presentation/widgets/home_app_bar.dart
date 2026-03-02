import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      elevation: 0,
      scrolledUnderElevation: 4,
      backgroundColor: Colors.white,
      expandedHeight: 150.h,
      automaticallyImplyLeading: false,

      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7.h),

                Text(
                  "Deliver to Home",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  "12 mins delivery",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(
            16.w,
            8.h,  
            16.w,
            14.h,
          ),
          child: SizedBox(
            height: 48.h,
            child: TextField(
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: "Search groceries...",
                hintStyle: TextStyle(fontSize: 14.sp),
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: Icon(Icons.search, size: 20.sp),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}