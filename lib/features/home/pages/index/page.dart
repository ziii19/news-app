import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:news/features/home/home.dart';

import '../../../news/blocs/news/news_bloc.dart';
import '../../../profile/profile.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        Future.delayed(const Duration(seconds: 2)).then((_) {
          if (state.status == Status.authenticated) {
            context.read<NewsBloc>().add(GetContent());
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
              (route) => false,
            );
          } else if (state.status == Status.unauthenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          } else {
            return;
          }
        });
      },
      child: Scaffold(
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
      ),
    );
  }
}
