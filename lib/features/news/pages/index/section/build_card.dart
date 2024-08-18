part of '../page.dart';

class _BuildNewsCard extends StatelessWidget {
  const _BuildNewsCard({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.viewCount,
    required this.timeAgo,
    this.onDetail,
    this.isLoading = false,
  });

  final String title;
  final String imageUrl;
  final String description;
  final int viewCount;
  final String timeAgo;
  final void Function()? onDetail;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.black, // Placeholder untuk image
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 20.0,
                        color: Colors.white, // Placeholder untuk title
                      ),
                      const SizedBox(height: 4.0),
                      Container(
                        width: double.infinity,
                        height: 14.0,
                        color: Colors.white, // Placeholder untuk description
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            width: 60.0,
                            height: 14.0,
                            color: Colors.white, // Placeholder untuk view count
                          ),
                          const SizedBox(width: 16.0),
                          Container(
                            width: 60.0,
                            height: 14.0,
                            color: Colors.white, // Placeholder untuk time ago
                          ),
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: CacheNetworkImagePlus(
                  boxFit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(8),
                  imageUrl: imageUrl,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
