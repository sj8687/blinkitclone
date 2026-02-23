import 'package:blinketclone/constants/appcolors.dart';
import 'package:blinketclone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class BlinkitLoginscreen extends StatefulWidget {
  const BlinkitLoginscreen({Key? key}) : super(key: key);

  @override
  State<BlinkitLoginscreen> createState() => _BlinkitLoginPageState();
}

class _BlinkitLoginPageState extends State<BlinkitLoginscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void loginUser() async {
    setState(() {
      isLoading = true;
      debugPrint("Email: ${emailController.text}");
      debugPrint("Password: ${passwordController.text}");
    });

    await Future.delayed(const Duration(seconds: 2)); 

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login Successful")),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              UiHelper.CustomImage(img: "logoblink.png"),

              const SizedBox(height: 10),

              UiHelper.CustomText(
                text: "India’s last minute app",
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w500,
                fontsize: 16,
              ),

              const SizedBox(height: 50),

              Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                      text: "Login",
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontsize: 22,
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: isLoading ? null : loginUser,
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : UiHelper.CustomText(
                                text: "Login",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontsize: 16,
                              ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Center(
                      child: UiHelper.CustomText(
                        text: "Forgot Password?",
                        color: AppColors.scaffoldBackgroundColor,
                        fontWeight: FontWeight.w600,
                        fontsize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}