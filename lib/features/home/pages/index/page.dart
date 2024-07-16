import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:news/features/home/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
              (route) => false,
            ));
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.newspaper_rounded,
              size: 80,
            ),
            Dimens.dp10.height,
            Text(
              'NEWS',
              style: GoogleFonts.comfortaa(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
