import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  static const title_doc = "Document Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_doc,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_doc),
        ),
        body: DocumentPage(),
      ),
    );
  }
}

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Welcome to Document Page",
              style: TextStyle(color: Colors.black,fontSize: 21)
          ),
        ),
      ),
    );
  }
}

