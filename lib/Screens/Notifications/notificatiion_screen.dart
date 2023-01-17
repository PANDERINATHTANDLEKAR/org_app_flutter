import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static const appTitle = 'Notification screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(appTitle),
        ),

        body: NotificationPage(title: 'Notification screen ',),
      ),
    );
  }
}



class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key, required String title}) : super(key: key);
  

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Welcome to Notification',
            style: TextStyle(color: Colors.black, fontSize: 20),

          ),
        ),
      ),
    );
  }
}
