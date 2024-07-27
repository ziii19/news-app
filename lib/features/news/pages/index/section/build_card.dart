part of '../page.dart';

class _BuildNewsCard extends StatelessWidget {
  const _BuildNewsCard({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.viewCount,
    required this.timeAgo,
    this.onDetail,
  });

  final String title;
  final String imageUrl;
  final String description;
  final int viewCount;
  final String timeAgo;
  final void Function()? onDetail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDetail,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(Icons.remove_red_eye),
                        const SizedBox(width: 4.0),
                        Text('$viewCount'),
                        const SizedBox(width: 16.0),
                        const Icon(Icons.access_time),
                        const SizedBox(width: 4.0),
                        Text(timeAgo),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
