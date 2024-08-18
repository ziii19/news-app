part of '../page.dart';

class _BuildNewsCard extends StatelessWidget {
  const _BuildNewsCard({
    required this.title,
    required this.imageUrl,
    required this.description,
    this.onDelete,
    this.onEdit,
  });

  final String title;
  final String imageUrl;
  final String description;
  final void Function()? onDelete;
  final void Function()? onEdit;

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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: CacheNetworkImagePlus(
                boxFit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: primary,
                        child: IconButton(
                          onPressed: onEdit,
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Dimens.dp10.width,
                      CircleAvatar(
                        backgroundColor: Colors.red.withOpacity(.8),
                        child: IconButton(
                          onPressed: onDelete,
                          icon: const Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )
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
