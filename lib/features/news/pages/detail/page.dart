import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:news/features/news/models/models.dart';

import '../../blocs/news/news_bloc.dart';

part 'section/image.dart';
part 'section/news_text.dart';
part 'section/bottom_content.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key, required this.item});

  final PostModel item;

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
              ImageSection(
                postImage: item.postImage,
              ),
              Dimens.dp6.height,
              NewsTextSection(
                title: item.title,
                description: item.newsContent,
              ),
              Dimens.dp20.height,
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomContent(
        id: item.id,
        viewCount: item.viewCount,
        likeCount: item.likes,
        timeAgo: item.createdAt,
        isLike: item.isLiked,
        username: item.author.username,
      ),
    );
  }
}
