part of '../page.dart';

class _FormRegister extends StatelessWidget {
  const _FormRegister();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            child: Column(
          children: [
            const RegularTextInput(hintText: 'Full Name'),
            Dimens.dp16.height,
            const RegularTextInput(hintText: 'Email'),
            Dimens.dp16.height,
            const RegularTextInput(hintText: 'Password'),
            Dimens.dp16.height,
            const RegularTextInput(hintText: 'Retype Password'),
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
                'Sign Up',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500, color: white),
              )),
        )
      ],
    );
  }
}
