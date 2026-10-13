
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blood_link/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Welcome(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
builder: (context, constraints) {
        final screenHeight= constraints.maxHeight;
        final screenWidth= constraints.maxWidth;

          return SingleChildScrollView(
            child: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/logo/logo_small_hq.png",
                      fit: BoxFit.contain,
                      
                    ),
                    SizedBox(height: 10),
                    SvgPicture.asset(
                      'assets/logo/Blood Link.svg',
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          );
}
        ),
      ),
    );
  }
}
