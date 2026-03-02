import 'package:blinketclone/repository/features/home/presentation/pages/home_page.dart';
import 'package:blinketclone/repository/features/home/presentation/widgets/home_app_bar.dart';
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

      designSize: const Size(375, 812),

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

          home:  HomePage(),
        );

      },
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView(
        
//           children: [
//             Lottie.asset('assets/animation/animation.json'),

           
//             // Lottie.network(
//             //   'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
//             // ),

//             Lottie.network(
//               'https://lottie.host/a0efc902-299c-4f97-8dc5-ea1b256cb6db/oIt6Zvg4iG.json'
//             ),

//             // Lottie.asset('assets/lottiefiles/angel.zip'),

          
//           ],
          
//         ),
//       ),
//     );
//   }
// }