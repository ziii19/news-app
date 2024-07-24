import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';

part 'section/image.dart';
part 'section/news_text.dart';
part 'section/bottom_content.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
        ),
        title: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.newspaper_rounded,
                  size: 25,
                  color: primary,
                ),
                Text(
                  'NewsApp',
                  style: GoogleFonts.comfortaa(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const ImageSection(),
              Dimens.dp6.height,
              const NewsTextSection(
                title: 'IND v/s SA ICC T20 WC',
                description:
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.lamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomContent(),
    );
  }
}
