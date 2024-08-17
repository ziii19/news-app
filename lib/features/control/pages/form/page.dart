import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news/core/core.dart';
import 'package:news/features/home/components/input.dart';
import 'package:news/features/news/blocs/news/news_bloc.dart';

class FormNewsPage extends StatefulWidget {
  const FormNewsPage({super.key});

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
    if (image != null) {
      context.read<NewsBloc>().add(AddContent(
          title: title!, newsContent: description!, image: File(image!.path)));

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Create new article successfuly')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Image must be filled!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    : null,
              ),
              child: image == null
                  ? const Icon(
                      Icons.add_a_photo_rounded,
                      size: 100,
                    )
                  : null,
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
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  title = titleController.text;
                  description = descriptionController.text;
                });
                //  add new article method
                addArticle();
              }
            },
            child: Text(
              'Add Article',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500, color: white),
            )),
      ),
    );
  }
}
