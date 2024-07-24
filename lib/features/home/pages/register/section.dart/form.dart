part of '../page.dart';

class _FormRegister extends StatefulWidget {
  const _FormRegister();

  @override
  State<_FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<_FormRegister> {
  String? username, firstname, lastname, email, password, passConfirm;
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

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
                hintText: 'Username',
                keyboardType: TextInputType.name,
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Username';
                  }
                  return null;
                },
              ),
              Dimens.dp16.height,
              RegularTextInput(
                hintText: 'First Name',
                keyboardType: TextInputType.name,
                controller: firstnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Firstname';
                  }
                  return null;
                },
              ),
              Dimens.dp16.height,
              RegularTextInput(
                hintText: 'Last Name',
                keyboardType: TextInputType.name,
                controller: lastnameController,
              ),
              Dimens.dp16.height,
              RegularTextInput(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter E-mail';
                  }
                  return null;
                },
              ),
              Dimens.dp16.height,
              InputPassword(
                hintText: 'Password',
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
              ),
              Dimens.dp16.height,
              InputPassword(
                hintText: 'Retype Password',
                controller: passConfirmController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Retype Password';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        Dimens.dp32.height,
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  username = usernameController.text;
                  firstname = firstnameController.text;
                  lastname = lastnameController.text;
                  email = emailController.text;
                  password = passwordController.text;
                  passConfirm = passConfirmController.text;
                });
                if (password == passConfirm) {
                  // register method
                  // register();
                } else {
                  SnackBar snackBar = const SnackBar(
                      content: Text(
                          "Please retype your password with the same value"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
            child: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
