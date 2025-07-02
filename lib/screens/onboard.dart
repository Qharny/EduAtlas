import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to EduAtlas",
          body: "Your global gateway to higher education",
          image: Center(
            child: Image.asset(
              'assets/images/education.png',
              height: 300,
              // loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              //   if (loadingProgress == null) return child;
              //   return Center(
              //     child: CircularProgressIndicator(
              //       value: loadingProgress.expectedTotalBytes != null
              //           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
              //           : null,
              //     ),
              //   );
              // },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50);
              },
            ),
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Explore Universities Worldwide",
          body: "Discover institutions across the globe with just a country name",
          image: Center(
            child:Image.asset(
              'assets/images/globe.png',
              height: 300,
              // loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              //   if (loadingProgress == null) return child;
              //   return Center(
              //     child: CircularProgressIndicator(
              //       value: loadingProgress.expectedTotalBytes != null
              //           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
              //           : null,
              //     ),
              //   );
              // },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50);
              },
            ),
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Make Informed Decisions",
          body: "Compare universities and find your perfect academic fit",
          image: Center(
            child: Image.asset(
              'assets/images/decision.png',
              height: 300,
              // loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              //   if (loadingProgress == null) return child;
              //   return Center(
              //     child: CircularProgressIndicator(
              //       value: loadingProgress.expectedTotalBytes != null
              //           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
              //           : null,
              //     ),
              //   );
              // },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50);
              },
            ),
          ),
          decoration: getPageDecoration(),
        ),
      ],
      onDone: () => _completeOnboarding(context),
      onSkip: () => _completeOnboarding(context),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: getDotDecoration(),
      globalBackgroundColor: Colors.white,
      skipOrBackFlex: 0,
      nextFlex: 0,
    );
  }

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);

    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const UniversityListScreen()),
      );
    }
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: const TextStyle(fontSize: 18),
      bodyPadding: const EdgeInsets.all(16),
      imagePadding: const EdgeInsets.all(24),
      // pageColor: Colors.white,
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.blue.shade50],
        ),
      ),
    );
  }

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
      color: const Color(0xFFBDBDBD),
      activeColor: Colors.blue,
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}