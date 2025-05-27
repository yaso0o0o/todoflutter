import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/news_app/core/theme/app_colors.dart';
import 'package:flutter_application_1/news_app/view/screens/app_layout.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreenNews extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const SplashScreenNews({super.key, required this.onThemeChanged});

  @override
  State<StatefulWidget> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<SplashScreenNews> {
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
            builder: (context) => OnBoardingScreen(onThemeChanged: widget.onThemeChanged),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Lottie.asset(
            "assets/animation/news.json",
            fit: BoxFit.cover,
            onLoaded: (composition) {
              print("Lottie animation loaded successfully");
            },
            errorBuilder: (context, error, stackTrace) {
              print("Error loading Lottie animation: $error");
              return const Text(
                "Error loading animation",
                style: TextStyle(color: Colors.red),
              );
            },
          ),
        ),
      ),
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const OnBoardingScreen({super.key, required this.onThemeChanged});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Map<String, dynamic>> onBoardingList = [
    {
      "title": "World News",
      "description": "Stay updated with the latest global news and events from around the world.",
      "animation": "assets/animation/world.json",
    },
    {
      "title": "Business Insights",
      "description": "Get the latest updates and insights on the business world and financial markets.",
      "animation": "assets/animation/tt.json",
    },
    {
      "title": "Technology Trends",
      "description": "Discover the latest advancements and trends in technology and innovation.",
      "animation": "assets/animation/technology.json",
    }
  ];

  PageController controller = PageController();

  int currentPageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: onBoardingList.length,
            onPageChanged: (index) {
              setState(() {
                currentPageNumber = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: 100),
                  if (onBoardingList[index].containsKey("animation"))
                    Lottie.asset(
                      onBoardingList[index]["animation"],
                      height: 325,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      onLoaded: (composition) {
                        print("Lottie animation loaded successfully");
                      },
                      errorBuilder: (context, error, stackTrace) {
                        print("Error loading Lottie animation: $error");
                        return const Text(
                          "Error loading animation",
                          style: TextStyle(color: Colors.red),
                        );
                      },
                    )
                  else
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
                        builder: (context) => AppLayout(onThemeChanged: widget.onThemeChanged),
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
                          builder: (context) => AppLayout(onThemeChanged: widget.onThemeChanged),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                    foregroundColor: AppColors.blackColor,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.greenColor,
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