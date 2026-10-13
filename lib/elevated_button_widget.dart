import 'package:blood_link/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:blood_link/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final PageController controller;
  final int currentPage;
  final int totalPages;
  final double screenHeight;
  final String? customText;

  const CustomElevatedButton({
    super.key,
    required this.controller,
    required this.currentPage,
    required this.totalPages,
    required this.screenHeight,
    this.customText, 
  });

  @override
  Widget build(BuildContext context) {
   
    final buttonText = customText ?? 
        (currentPage == totalPages - 1 ? "Get Started" : "Next");

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (currentPage == totalPages - 1) {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (c) => const LoginScreen()),
            );
          } else {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInSine,
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.015,
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}