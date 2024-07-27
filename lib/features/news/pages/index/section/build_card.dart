part of '../page.dart';

class _BuildNewsCard extends StatelessWidget {
  const _BuildNewsCard({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.shareCount,
    required this.timeAgo,
    required this.isLike,
    this.onTap,
  });

  final String title;
  final String imageUrl;
  final String description;
  final int shareCount;
  final String timeAgo;
  final bool isLike;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailNewsPage()));
                    },
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      InkWell(
                          onTap: onTap,
                          child: Icon(
                            isLike ? Icons.favorite : Icons.favorite_border,
                            color: isLike ? Colors.red : null,
                          )),
                      const SizedBox(width: 4.0),
                      Text(shareCount >= 2
                          ? '$shareCount likes'
                          : shareCount >= 1
                              ? '$shareCount like'
                              : 'like'),
                      const SizedBox(width: 16.0),
                      const Icon(Icons.access_time),
                      const SizedBox(width: 4.0),
                      Text(timeAgo),
                      const SizedBox(width: 16.0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
