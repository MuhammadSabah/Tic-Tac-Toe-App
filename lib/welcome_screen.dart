import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:game_test/home_page.dart';
import 'constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor1,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            const Center(
              child: Text(
                'Tic  Tac  Toe',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: whiteColor1,
                ),
              ),
            ),
            Spacer(),
            Container(
              child: AvatarGlow(
                endRadius: 120,
                duration: const Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                showTwoGlows: true,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Image.asset(
                    'assets/ttt2.png',
                    fit: BoxFit.fill,
                  ),
                  radius: 75,
                ),
              ),
            ),
            Spacer(),
            const Center(
              child: Text(
                'CreatedByHamaDev',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: whiteColor1,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: whiteColor1,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Play Game',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: blackColor1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
