import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news/core/core.dart';
import 'package:news/features/home/components/input.dart';
import 'package:news/features/news/blocs/news/news_bloc.dart';

import '../../../news/news.dart';

class FormNewsPage extends StatefulWidget {
  const FormNewsPage({super.key, this.news});

  final PostModel? news;

  @override
  State<FormNewsPage> createState() => _FormNewsPageState();
}

class _FormNewsPageState extends State<FormNewsPage> {
  String? title, description;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  XFile? image;

  final _formKey = GlobalKey<FormState>();

  void addArticle() async {
    if (image != null || widget.news!.postImage.isNotEmpty) {
      context.read<NewsBloc>().add(AddContent(
          title: title!, newsContent: description!, image: File(image!.path)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Image must be filled!')));
    }
  }

  void updateArticle() async {
    if (title != widget.news!.title ||
        description != widget.news!.newsContent ||
        image != null) {
      context.read<NewsBloc>().add(UpdateContent(
          title: title!,
          id: widget.news!.id,
          newsContent: description!,
          image: image != null ? File(image!.path) : null));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Gada perubahan gausah mencet update!')));
    }
  }

  @override
  void initState() {
    if (widget.news != null) {
      titleController.text = widget.news!.title;
      descriptionController.text = widget.news!.newsContent;
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  DecorationImage? decorationImage() {
    if (image != null) {
      return DecorationImage(
        image: FileImage(File(image!.path)),
        fit: BoxFit.cover,
      );
    } else if (widget.news!.postImage.isNotEmpty) {
      return DecorationImage(
        image: NetworkImage(widget.news!.postImage),
        fit: BoxFit.cover,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(widget.news != null
                  ? 'Update article successfuly'
                  : 'Create new article successfuly')));
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
          backgroundColor: primary,
          title: const Text("Add new article"),
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () async {
                var img =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                setState(() {
                  image = img;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(20.0),
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20),
                  image: image != null
                      ? DecorationImage(
                          image: FileImage(File(image!.path)),
                          fit: BoxFit.cover,
                        )
                      : widget.news != null
                          ? DecorationImage(
                              image: image != null
                                  ? FileImage(File(image!.path))
                                  : NetworkImage(widget.news!.postImage),
                              fit: BoxFit.cover,
                            )
                          : null,
                ),
                child: widget.news != null || image != null
                    ? null
                    : const Icon(
                        Icons.add_a_photo_rounded,
                        size: 100,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.dp16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    RegularTextInput(
                      hintText: 'title',
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required!';
                        }
                        return null;
                      },
                    ),
                    Dimens.dp16.height,
                    RegularTextInput(
                      hintText: 'Description',
                      minLines: 5,
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description is required!';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          height: 50,
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: state.status == Status.loading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              title = titleController.text;
                              description = descriptionController.text;
                            });
                            //  add new article method
                            widget.news != null
                                ? updateArticle()
                                : addArticle();
                          }
                        },
                  child: state.status == Status.loading
                      ? const CircularProgressIndicator()
                      : Text(
                          widget.news != null
                              ? 'Update Article'
                              : 'Add Article',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: white),
                        ));
            },
          ),
        ),
      ),
    );
  }
}
