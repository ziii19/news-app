import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/core.dart';
import 'package:news/features/home/home.dart';
import 'package:news/features/profile/blocs/blocs.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDark = false;

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
      context.read<UserBloc>().add(LogoutEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.newspaper_rounded,
                      size: 25,
                      color: primary,
                    ),
                    Text(
                      'NewsApp',
                      style: GoogleFonts.comfortaa(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return SafeArea(
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(.5),
                              // image:
                            ),
                          ),
                          Dimens.dp18.width,
                          Text(
                            state.user?.username ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              // color: black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SettingItem(
              icon: Icons.language,
              title: 'Select Language',
              subtitle: 'English',
            ),
            const SettingItem(
              icon: Icons.location_on,
              title: 'Select Location',
              subtitle: 'Delhi',
            ),
            Card(
              child: BlocBuilder<ThemeCubit, bool>(
                builder: (context, isDark) {
                  return SwitchListTile(
                    title: Row(
                      children: [
                        const Icon(Icons.sunny),
                        Dimens.dp12.width,
                        const Text('Dark Theme'),
                      ],
                    ),
                    value: isDark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme(value);
                    },
                  );
                },
              ),
            ),
            const SettingItem(
              icon: Icons.notifications,
              title: 'Notifications',
            ),
            const SettingItem(
              icon: Icons.info_outline,
              title: 'About us',
            ),
            const SettingItem(
              icon: Icons.headset_mic,
              title: 'Contact us',
            ),
            const SettingItem(
              icon: Icons.feedback,
              title: 'Feedback',
            ),
            const SettingItem(
              icon: Icons.share,
              title: 'Refer the App',
            ),
            const SettingItem(
              icon: Icons.star,
              title: 'Rate us',
            ),
            SettingItem(
              onTap: () {
                confirm();
              },
              icon: Icons.logout,
              title: 'Sign out',
            ),
          ],
        ),
      ),
    );
  }

  void confirm() {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Exit Application",
          style: TextStyle(color: Color(0xff68C4C6)),
        ),
        content: const Text(
          "Are You Sure?",
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              showLoadingDialog(context);
            },
          ),
          TextButton(
            child: const Text(
              "No",
              style: TextStyle(color: Color(0xff68C4C6)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final void Function()? onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(title),
        trailing: subtitle != null
            ? Text(
                subtitle!,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            : null,
      ),
    );
  }
}
