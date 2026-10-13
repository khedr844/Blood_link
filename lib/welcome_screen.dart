import 'package:blood_link/colors.dart';
import 'package:blood_link/elevated_button_widget.dart';
import 'package:blood_link/login_screen.dart';
import 'package:blood_link/welcome_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      imageAsset: 'assets/welcome_images/hero_illustration_hq.png',
      title: 'Donate Blood',
      description: "Your blood donation makes a real difference in someone's life.\nJoin us today and help save lives with just a simple step.",
    ),
    OnboardingModel(
      imageAsset: 'assets/welcome_images/Groups_hq.png',
      title: 'Save Lifes',
      description: "A single blood donation can give a second chance at life to patients\nand emergency cases in urgent need.",
    ),
    OnboardingModel(
      imageAsset: 'assets/welcome_images/Image_hq.png',
      title: 'Get Connect Community',
      description: "Become part of a connected community that links donors with those\nin urgent need of blood quickly and easily.",
    ),
  ];

  final controller = PageController();
int currentpage=0;
  @override
  Widget build(BuildContext context) {
    // جلب مقاسات الشاشة باستخدام MediaQuery
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(" "),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                
                SizedBox(
                  height: screenHeight * 0.48, 
                  child: PageView.builder(
                    controller: controller,
                    itemCount: onboardingItems.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentpage=value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          SizedBox(
                            height: screenHeight * 0.28,
                            child: Image.asset(
                              onboardingItems[index].imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            onboardingItems[index].title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            onboardingItems[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

               
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: onboardingItems.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: AppColor.primary,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                CustomElevatedButton(
                  controller: controller, 
                  currentPage: currentpage, 
                  totalPages: onboardingItems.length, 
                  screenHeight: screenHeight,
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}