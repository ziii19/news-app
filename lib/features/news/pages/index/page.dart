import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:news/features/news/pages/detail/page.dart';

part 'section/build_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
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
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primary)),
                hintText: 'Search News',
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Dimens.dp16.height,
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const _BuildNewsCard(
                    title: 'Mumbai local train',
                    imageUrl: 'assets/images/train.png',
                    description:
                        'Local train services, considered as the lifeline o',
                    shareCount: 76,
                    timeAgo: '2 Hours ago',
                  );
                },
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return Dimens.dp10.height;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
