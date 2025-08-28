import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;
  final Animation<Offset> slideAnimation;

  const SplashContent({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/Gif/splash.gif', fit: BoxFit.cover),
            const SizedBox(height: 40),
            // App Name
            SlideTransition(
              position: slideAnimation,
              child: const Text(
                'EduAtlas',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Tagline
            SlideTransition(
              position: slideAnimation,
              child: Text(
                'Your Global Gateway to Higher Education',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
