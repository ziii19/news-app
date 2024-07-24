import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:news/features/home/components/input.dart';

class FormNewsPage extends StatefulWidget {
  const FormNewsPage({super.key});

  @override
  State<FormNewsPage> createState() => _FormNewsPageState();
}

class _FormNewsPageState extends State<FormNewsPage> {
  String? title, description;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          Container(
            margin: const EdgeInsets.all(20.0),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.2),
              borderRadius: BorderRadius.circular(20),
              // image: const DecorationImage(
              //   image: ,
              //   fit: BoxFit.cover,
              // ),
            ),
            child: const Icon(
              Icons.add_a_photo_rounded,
              size: 100,
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
                // addArticle();
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
