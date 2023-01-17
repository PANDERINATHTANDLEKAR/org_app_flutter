import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const title_profile = "Profile Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_profile,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_profile),
        ),
        body: ProfileHomePage(),
      ),
    );
  }
}


class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({Key? key}) : super(key: key);

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Welcome to Profile Page",
              style: TextStyle(color: Colors.black,fontSize: 21)
          ),
        ),
      ),
    );
  }
}
