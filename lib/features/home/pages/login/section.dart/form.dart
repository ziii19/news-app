part of '../page.dart';

class _FormLogin extends StatelessWidget {
  const _FormLogin();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            child: Column(
          children: [
            const RegularTextInput(hintText: 'Email'),
            Dimens.dp16.height,
            const RegularTextInput(hintText: 'Password'),
          ],
        )),
        Dimens.dp32.height,
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {},
              child: Text(
                'Sign In',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500, color: white),
              )),
        )
      ],
    );
  }
}
