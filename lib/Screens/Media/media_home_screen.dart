import 'package:flutter/material.dart';

class MediaHomeScreen extends StatelessWidget {
  const MediaHomeScreen({Key? key}) : super(key: key);

  static const title_media = "Madia Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_media,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_media),
        ),
        body: MediaHomePage(),
      ),
    );
  }
}


class MediaHomePage extends StatefulWidget {
  const MediaHomePage({Key? key}) : super(key: key);

  @override
  State<MediaHomePage> createState() => _MediaHomePageState();
}

class _MediaHomePageState extends State<MediaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Welcome to Media Home Page",
              style: TextStyle(color: Colors.black,fontSize: 21)
          ),
        ),
      ),
    );
  }
}

