part of '../page.dart';

class BottomContent extends StatelessWidget {
  const BottomContent({
    super.key,
  });

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
                  'Jane Cooper',
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
                      '76',
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
                      '17 sept 2022',
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
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.thumb_up_rounded,
                    size: 30,
                  ),
                  Text('Like')
                ],
              ),
              Dimens.dp8.width,
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.share,
                    size: 30,
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
