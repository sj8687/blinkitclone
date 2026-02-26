import 'dart:convert';

import 'package:blinketclone/constants/appcolors.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class BlinkitCartscreen extends StatefulWidget {
  const BlinkitCartscreen({Key? key}) : super(key: key);

  @override
  State<BlinkitCartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<BlinkitCartscreen> {
  final TextEditingController searchController = TextEditingController();

  final storage = const FlutterSecureStorage();

  List<dynamic> cartItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCart();
  }

  Future<void> fetchCart() async {
    var token = await storage.read(key: 'jwt');

    final url = Uri.parse("http://localhost:3000/cart");

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          cartItems = data;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print("Failed to fetch cart");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error: $e");
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
              color: AppColors.scaffoldBackgroundColor,
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
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: "bold",
                          fontsize: 14.sp,
                        ),

                        UiHelper.CustomText(
                          text: "16 minutes",
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "extrabolditalic",
                          fontsize: 20.sp,
                        ),

                        SizedBox(height: 4.h),

                        UiHelper.CustomText(
                          text: "HOME - shreyash, Maharastra",
                          color: AppColors.secondaryColor,
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
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : cartItems.isEmpty
                ? Center(child: Text("Cart is empty"))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return ListTile(
                        leading: Image.network(
                          item["image"],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item["name"]),
                        subtitle: Text("₹${item["price"]}"),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
