import 'package:flutter/material.dart';

class DuesHomeScreen extends StatelessWidget {
  const DuesHomeScreen({Key? key}) : super(key: key);

  static const title_dues = "Dues Home Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_dues,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_dues),
        ),
        body: DuesHomePage(),
      ),
    );
  }
}


class DuesHomePage extends StatefulWidget {
  const DuesHomePage({Key? key}) : super(key: key);

  @override
  State<DuesHomePage> createState() => _DuesHomePageState();
}

class _DuesHomePageState extends State<DuesHomePage> {
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

