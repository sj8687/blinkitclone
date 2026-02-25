import 'package:blinketclone/repository/screens/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilPlusInit(

      designSize: const Size(360, 690),

      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {

        return MaterialApp(
          title: 'Blinket',
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            useMaterial3: false,
          ),

          home:  Splashscreen(),
        );

      },
    );
  }
}