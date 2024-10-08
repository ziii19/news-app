import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:shimmer/shimmer.dart';

import '../../blocs/news/news_bloc.dart';
import '../detail/page.dart';

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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: SafeArea(
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
          )
        ],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Expanded(
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state.status == Status.loading) {
                      // Menampilkan placeholder shimmer
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return const _BuildNewsCard(
                            title: '',
                            imageUrl: '',
                            description: '',
                            viewCount: 0,
                            timeAgo: '',
                            isLoading: true,
                          );
                        },
                        itemCount: 3,
                        separatorBuilder: (BuildContext context, int index) {
                          return Dimens.dp10.height;
                        },
                      );
                    }

                    if (state.status == Status.success &&
                        state.news.isNotEmpty) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          final content = state.news[index];
                          return _BuildNewsCard(
                            title: content.title,
                            imageUrl: content.postImage,
                            description: content.newsContent,
                            viewCount: content.viewCount,
                            timeAgo: content.createdAt,
                            isLoading: false,
                            onDetail: () {
                              context
                                  .read<NewsBloc>()
                                  .add(ShowContent(id: content.id));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailNewsPage(
                                            item: content,
                                          )));
                            },
                          );
                        },
                        itemCount: state.news.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Dimens.dp10.height;
                        },
                      );
                    }

                    return const Center(
                      child: Text('No news available'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
