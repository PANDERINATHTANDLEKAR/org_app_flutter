import 'package:flutter/material.dart';

class SocialTrackScreen extends StatelessWidget {
  const SocialTrackScreen({Key? key}) : super(key: key);

  static const title_social_trage = "Social Track Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: title_social_trage,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_social_trage),
        ),
        body: SocialTrackPage(),
      ),
    );
  }
}


class SocialTrackPage extends StatefulWidget {
  const SocialTrackPage({Key? key}) : super(key: key);

  @override
  State<SocialTrackPage> createState() => _SocialTrackPageState();
}

class _SocialTrackPageState extends State<SocialTrackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Welcome to Social Track Page",
              style: TextStyle(color: Colors.black,fontSize: 21)
          ),
        ),
      ),

    );
  }


}



