import 'package:flutter/material.dart';

class MarketPlaceScreen extends StatelessWidget {
  const MarketPlaceScreen({Key? key}) : super(key: key);

  static const title_mktPage = "MarketPlace Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_mktPage,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_mktPage),
        ),
        body: MarketPlacePage(),
      ),
    );
  }
}


class MarketPlacePage extends StatefulWidget {
  const MarketPlacePage({Key? key}) : super(key: key);

  @override
  State<MarketPlacePage> createState() => _MarketPlacePageState();
}

class _MarketPlacePageState extends State<MarketPlacePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Welcome to MarketPlace Page",
              style: TextStyle(color: Colors.black,fontSize: 21)
          ),
        ),
      ),
    );
  }
}
