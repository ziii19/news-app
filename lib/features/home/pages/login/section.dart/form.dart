part of '../page.dart';

class _FormLogin extends StatefulWidget {
  const _FormLogin();

  @override
  State<_FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<_FormLogin> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                RegularTextInput(
                  hintText: 'Email',
                  controller: mailController,
                ),
                Dimens.dp16.height,
                RegularTextInput(
                  hintText: 'Password',
                  controller: passController,
                ),
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
