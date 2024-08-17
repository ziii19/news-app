part of '../page.dart';

class BottomContent extends StatefulWidget {
  const BottomContent({
    super.key,
    required this.likeCount,
    required this.timeAgo,
    required this.isLike,
    required this.username,
    required this.id,
    required this.viewCount,
  });

  final int id;
  final String username;
  final int viewCount;
  final int likeCount;
  final String timeAgo;
  final bool isLike;

  @override
  State<BottomContent> createState() => _BottomContentState();
}

class _BottomContentState extends State<BottomContent> {
  late bool isLike;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    // Initialize local state variables with widget values
    isLike = widget.isLike;
    likeCount = widget.likeCount;
  }

  void _toggleLike() {
    if (isLike) {
      context.read<NewsBloc>().add(LikeContent(id: widget.id));
    } else {
      context.read<NewsBloc>().add(UnlikeContent(id: widget.id));
    }
    setState(() {
      // Update the like count and isLiked status
      if (isLike) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLike = !isLike;
    });

    // Update Bloc or any other state management solution
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 70,
      decoration:
          const BoxDecoration(border: Border(top: BorderSide(color: black))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          Dimens.dp8.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.username,
                  style: GoogleFonts.comfortaa(
                      fontSize: 14, fontWeight: FontWeight.bold, color: grey),
                ),
                Dimens.dp8.height,
                Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      color: grey,
                      size: 15,
                    ),
                    Dimens.dp4.width,
                    Text(
                      widget.viewCount.toString(),
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: grey),
                    ),
                    Dimens.dp16.width,
                    const Icon(
                      Icons.access_time,
                      color: grey,
                      size: 15,
                    ),
                    Dimens.dp4.width,
                    Text(
                      widget.timeAgo,
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: _toggleLike,
                      child: Icon(
                        isLike ? Icons.favorite : Icons.favorite_border,
                        color: isLike ? Colors.red : null,
                      )),
                  const SizedBox(width: 4.0),
                  Text(likeCount >= 2
                      ? '$likeCount likes'
                      : likeCount >= 1
                          ? '$likeCount like'
                          : 'like'),
                ],
              ),
              Dimens.dp8.width,
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.share,
                  ),
                  Text('Share')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
