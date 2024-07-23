part of '../page.dart';

class _FormLogin extends StatefulWidget {
  const _FormLogin();

  @override
  State<_FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<_FormLogin> {
  String? email, password;
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
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  controller: mailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter E-mail';
                    }
                    return null;
                  },
                ),
                Dimens.dp16.height,
                InputPassword(
                  hintText: "Password",
                  controller: passController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
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
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   setState(() {
                //     email = mailController.text;
                //     password = passController.text;
                //   });
                //   //  login method
                //   // login();
                // }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
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
