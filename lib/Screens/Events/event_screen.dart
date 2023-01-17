import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  static const title_event = "Event Page";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_event,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_event),
        ),
        body: EventPage(),
      ),
    );
  }
}

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
            text: "Welcome to Event Page",
            style: TextStyle(color: Colors.black,fontSize: 21)
          ),
        ),
      ),
    );
  }
}

