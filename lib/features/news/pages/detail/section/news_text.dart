part of '../page.dart';

class NewsTextSection extends StatelessWidget {
  const NewsTextSection({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            description,
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
