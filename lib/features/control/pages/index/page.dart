import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:news/features/control/control.dart';

import '../../../news/blocs/news/news_bloc.dart';
import '../../../profile/profile.dart';

part 'section/build_card.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
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
                  hintText: 'Search your article',
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
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  return BlocBuilder<UserBloc, UserState>(
                    builder: (context, user) {
                      final data = state.news
                          .where(
                            (element) => element.author.id == user.user!.id,
                          )
                          .toList();
                      return Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return _BuildNewsCard(
                              title: data[index].title,
                              imageUrl: data[index].postImage,
                              description: data[index].newsContent,
                              onDelete: () {
                                context
                                    .read<NewsBloc>()
                                    .add(DeleteContent(id: data[index].id));
                              },
                              onEdit: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormNewsPage(
                                              news: data[index],
                                            )));
                              },
                            );
                          },
                          itemCount: data.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Dimens.dp10.height;
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const FormNewsPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
