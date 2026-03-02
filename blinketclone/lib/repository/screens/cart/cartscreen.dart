import 'dart:async';
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
  BlinkitCartscreenState createState() => BlinkitCartscreenState();
}

class BlinkitCartscreenState extends State<BlinkitCartscreen> {
  final TextEditingController searchController = TextEditingController();

  final storage = const FlutterSecureStorage();

  List<dynamic> cartItems = [];
  bool isLoading = true;

  Future<void> updateQuantityAPI(String cartId, int qty) async {
    try {
      var token = await storage.read(key: 'jwt');
      final response = await http.patch(
        Uri.parse("http://localhost:3000/cart/updateqty"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"productName": cartId, "qty": qty}),
      );

      if (response.statusCode == 200) {
        print("Quantity updated successfully");
      } else {
        print("Failed to update quantity");
      }
    } catch (e) {
      print("Error updating quantity: $e");
    }
  }

  Timer? _debounce;

  void updateQuantity(Map item, int newQty) {
    if (newQty < 1 || newQty > 10) return;

    setState(() {
      item["qty"] = newQty;
    });

    updateQuantityAPI(item["productName"], newQty);
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

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);

        print("hiiii $data");

        setState(() {
          cartItems = data["myCarts"];
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

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 6,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Product Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item["imageUrl"] ?? "",
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Product Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["productName"] ?? "",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "₹${item["price"]}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Quantity Controls
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      updateQuantity(item, item["qty"] - 1);
                                    },
                                    icon: const Icon(Icons.remove, size: 18),
                                    color: Colors.green,
                                  ),
                                  Text(
                                    item["qty"].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      updateQuantity(item, item["qty"] + 1);
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
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
