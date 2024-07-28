part of '../page.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.postImage,
  });

  final String postImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(postImage),
            fit: BoxFit.cover,
          )),
    );
  }
}
