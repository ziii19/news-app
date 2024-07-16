import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:news/features/home/components/input.dart';
import 'package:news/features/home/home.dart';

part 'section.dart/form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          Column(
            children: [
              Dimens.dp50.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.newspaper_rounded,
                    size: 25,
                    color: primary,
                  ),
                  Text(
                    'News',
                    style: GoogleFonts.comfortaa(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primary),
                  )
                ],
              ),
              Dimens.dp50.height,
              Text(
                'Sign In',
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w600, color: primary),
              ),
              Dimens.dp20.height,
              const _FormLogin(),
              Dimens.dp32.height,
              Text(
                "Do you have an account? ",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),
              Dimens.dp10.height,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: primary,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
