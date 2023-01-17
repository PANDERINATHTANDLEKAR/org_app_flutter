import 'package:flutter/material.dart';

class PollsHomeScreen extends StatelessWidget {
  const PollsHomeScreen({Key? key}) : super(key: key);

  static const title_polls = "Polls screen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_polls,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_polls),
        ),
        body: PollsHomePage(),
      ),
    );
  }
}


class PollsHomePage extends StatefulWidget {
  const PollsHomePage({Key? key}) : super(key: key);

  @override
  State<PollsHomePage> createState() => _PollsHomePageState();
}

class _PollsHomePageState extends State<PollsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Welcome to Dues Page",
              style: TextStyle(color: Colors.black,fontSize: 21)
          ),
        ),
      ),

    );
  }
}

