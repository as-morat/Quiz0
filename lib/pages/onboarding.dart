import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.network(
              "https://wallpaperbat.com/img/456044-education-wallpaper.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/logo.png",
              color: Colors.deepOrange,
              width: size.width,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade100,
                  elevation: 5,
                  shadowColor: Colors.amber.shade100,
                  minimumSize: Size(size.width / 1.5, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  context.go('/home');
                },
                child: const Text(
                  "Start Playing",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
