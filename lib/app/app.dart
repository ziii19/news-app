import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news/blocs/news/news_bloc.dart';
import 'package:news/features/profile/blocs/blocs.dart';

import '../features/home/home.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(create: (context) => ThemeCubit()..loadTheme()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            theme: isDark
                ? ThemeData.dark(useMaterial3: true)
                : ThemeData.light(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
