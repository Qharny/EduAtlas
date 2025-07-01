import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gif/gif.dart';
import 'home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with TickerProviderStateMixin {
  late GifController _controller1;
  late GifController _controller2;
  late GifController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = GifController(vsync: this);
    _controller2 = GifController(vsync: this);
    _controller3 = GifController(vsync: this);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to EduAtlas",
          body: "Your global gateway to higher education",
          image: Center(
            child: SizedBox(
              height: 300,
              child: Gif(
                image: const AssetImage("assets/Gif/Education.gif"),
                controller: _controller1,
                autostart: Autostart.once,
                placeholder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
                onFetchCompleted: () {
                  _controller1.reset();
                  _controller1.forward();
                },
              ),
            ),
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Explore Universities Worldwide",
          body: "Discover institutions across the globe with just a country name",
          image: Center(
            child: SizedBox(
              height: 300,
              child: Gif(
                image: const AssetImage("assets/Gif/projectgif"),
                controller: _controller2,
                autostart: Autostart.once,
                placeholder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
                onFetchCompleted: () {
                  _controller2.reset();
                  _controller2.forward();
                },
              ),
            ),
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Make Informed Decisions",
          body: "Compare universities and find your perfect academic fit",
          image: Center(
            child: SizedBox(
              height: 300,
              child: Gif(
                image: const AssetImage("assets/Gif/admission.gif"),
                controller: _controller3,
                autostart: Autostart.loop,
                placeholder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
                onFetchCompleted: () {
                  _controller3.reset();
                  _controller3.forward();
                },
              ),
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