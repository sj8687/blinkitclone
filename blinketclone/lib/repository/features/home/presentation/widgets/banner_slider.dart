import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0;

  final List<Color> bannerColors = [
    Colors.orange,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),

        SizedBox(
          height: 150.h, 
          child: PageView.builder(
            itemCount: bannerColors.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            controller: PageController(viewportFraction: 0.9),
            itemBuilder: (_, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  color: bannerColors[index],
                  alignment: Alignment.center,
                  child: Text(
                    "Banner ${index + 1}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 12.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            bannerColors.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: _currentIndex == index ? 16.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.black
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
        ),

        SizedBox(height: 12.h),
      ],
    );
  }
}