import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  final VoidCallback onComplete;

  const OnboardingPage({super.key, required this.onComplete});

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
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50);
              },
            ),
          ),
          decoration: _getPageDecoration(),
        ),
        PageViewModel(
          title: "Explore Universities Worldwide",
          body:
              "Discover institutions across the globe with just a country name",
          image: Center(
            child: Image.asset(
              'assets/images/globe.png',
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50);
              },
            ),
          ),
          decoration: _getPageDecoration(),
        ),
        PageViewModel(
          title: "Make Informed Decisions",
          body: "Compare universities and find your perfect academic fit",
          image: Center(
            child: Image.asset(
              'assets/images/decision.png',
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50);
              },
            ),
          ),
          decoration: _getPageDecoration(),
        ),
      ],
      onDone: onComplete,
      onSkip: onComplete,
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: _getDotDecoration(),
      globalBackgroundColor: Colors.white,
      skipOrBackFlex: 0,
      nextFlex: 0,
    );
  }

  PageDecoration _getPageDecoration() {
    return PageDecoration(
      titleTextStyle: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: const TextStyle(fontSize: 18),
      bodyPadding: const EdgeInsets.all(16),
      imagePadding: const EdgeInsets.all(24),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.blue.shade50],
        ),
      ),
    );
  }

  DotsDecorator _getDotDecoration() {
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
