import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_app_screens/todo_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToTheNextScreen();
  }

  void navigateToTheNextScreen() {
    Timer(
      const Duration(seconds: 2),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffe53170),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "TODO LIST APP",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontFamily: "playfair",
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> onBoardingList = [
    {
      "title": "Organize Your Tasks",
      "description": "Keep track of your daily tasks and stay organized with our easy-to-use to-do list app.",
      "image": "assets/image/onboarding1.png",
    },
    {
      "title": "Set Reminders",
      "description": "Never miss a deadline again. Set reminders for your important tasks and events.",
      "image": "assets/image/onboarding2.png",
    },
    {
      "title": "Get Started",
      "description": "Take control of your productivity. Get started with our to-do list app today!",
      "image": "assets/image/onboarding3.png",
    }
  ];
  PageController controller = PageController();
  int currentPageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe53170),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: onBoardingList.length,
            onPageChanged: (index) {
              currentPageNumber = index;
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: 100),
                  Image.asset(
                    onBoardingList[index]["image"],
                    height: 325,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      onBoardingList[index]["title"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontFamily: "playfair",
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      onBoardingList[index]["description"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodoSplashScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: onBoardingList.length,
                  effect: SwapEffect(
                    dotColor: Colors.white.withOpacity(.20),
                    dotWidth: 6,
                    dotHeight: 6,
                    activeDotColor: Colors.white,
                  ),
                  onDotClicked: (index) {
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentPageNumber != onBoardingList.length - 1) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.fastOutSlowIn,
                      );
                      currentPageNumber++;
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TodoSplashScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffe53170),
                    size: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}