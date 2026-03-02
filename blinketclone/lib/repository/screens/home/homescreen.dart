import 'dart:convert';

import 'package:blinketclone/constants/appcolors.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class BlinkitHomescreen extends StatefulWidget {
  const BlinkitHomescreen({Key? key}) : super(key: key);

  @override
  State<BlinkitHomescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<BlinkitHomescreen> {
  final storage = FlutterSecureStorage();

  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> products = List.generate(40, (index) {
    return {
      "productName": "Product ${index + 1}",
      "price": ((index + 1) * 10).toStringAsFixed(2),
      "imageUrl": "https://picsum.photos/200?random=$index",
    };
  });

  Future<void> addToCart(Map<String, dynamic> item) async {
    final token = await storage.read(key: 'jwt');
    final url = Uri.parse("http://localhost:3000/cart/add");

    print(item);
    print(token);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "productName": item["productName"],
        "price": item["price"],
        "imageUrl": item["imageUrl"],
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Product added to cart successfully");
    } else {
      print("Failed to add to cart");
    }
  }

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
                          color: Colors.white,
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
            child: GridView.builder(
              padding: EdgeInsets.all(12.w),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.55,
              ),

              itemBuilder: (context, index) {
                final item = products[index];

                double price = double.parse(item["price"].toString());
                String formattedPrice = price % 1 == 0
                    ? price.toInt().toString()
                    : price.toStringAsFixed(2);

                print(item);

                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 232, 232),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          item["imageUrl"],
                          height: 60.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        item["productName"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                       "₹$formattedPrice",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[700],
                        ),
                      ),

                      SizedBox(height: 10.h),

                      SizedBox(
                        width: double.infinity,
                        height: 30.h,
                        child: ElevatedButton(
                          onPressed: () {
                            addToCart(item);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text("ADD", style: TextStyle(fontSize: 12.sp)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
