import 'dart:math';

import 'package:flutter/material.dart';
import 'package:org_app_flutter/Screens/Documents/document_screen.dart';
import 'package:org_app_flutter/Screens/Dues/dues_home_screen.dart';
import 'package:org_app_flutter/Screens/Events/event_screen.dart';
import 'package:org_app_flutter/Screens/Login/login_org_screen.dart';
import 'package:org_app_flutter/Screens/Login/login_screen.dart';
import 'package:org_app_flutter/Screens/MarketPlace/marketpage_screen.dart';
import 'package:org_app_flutter/Screens/Media/media_home_screen.dart';
import 'package:org_app_flutter/Screens/Polls/polls_home_screen.dart';
import 'package:org_app_flutter/Screens/Profile/profile_screen.dart';
import 'package:org_app_flutter/Screens/Social%20Track/social_track_screen.dart';
import 'dart:developer';
import 'package:org_app_flutter/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/background.dart';
import '../Notifications/notificatiion_screen.dart';
import '../Events/event_screen.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

String finalEmail = "NA";

class LoginForm2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const appTitle = 'My Dashboard';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(appTitle),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen();
                    },
                  ),
                );
              },
            )
          ],
          /*actions: [
            PopupMenuButton(itemBuilder: (context) =>
            [
              PopupMenuItem(
                  value: 0,
                  child: Text("Settings")
              ),
              PopupMenuItem(
                  value: 1,
                  child: Text("Home")
              ),
              PopupMenuItem(
                  value: 2,
                  child: Text("Logout")
              ),
            ], onSelected: (item) => SelectedItem(context, item),)
          ],*/
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('My Org'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginOrgScreen();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Notification'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NotificationScreen();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Events'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EventScreen();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Documents'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DocumentScreen();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Media'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MediaHomeScreen();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Market Place'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MarketPlaceScreen();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Dues'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DuesHomeScreen();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Polls'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PollsHomeScreen();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Social track'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SocialTrackScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: MyCustomForm(),
      ),
    );
    throw UnimplementedError();
  }

  SelectedItem(BuildContext context, Object? item) {
    switch (item) {
      case 0:
        print("Setting clicked");
        break;
      case 1:
        print("Home clicked");
        break;
      case 2:
        print("Logout clicked");
        Logout(context);
        break;
    }
  }


}

class MyCustomForm extends StatefulWidget {
  //const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }

}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
  final _textEmail = TextEditingController();
  var _userName;

  @override
  void initState() {
    super.initState();
  }

  void updateText(val) {
    setState(() {
      _userName = val;
    });
  }

  Future getValidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? obtainedEmail = "NA";
    obtainedEmail = preferences.getString('email');

    setState(() {
      finalEmail = obtainedEmail!;
    });

    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Container(
        child: Center(
          child: RichText(
            text: TextSpan(
                text: 'Welcome to Dashboard',
                style: TextStyle(color: Colors.black, fontSize: 20),

            ),
          ),
        ),
    );
        throw UnimplementedError();
  }

}

void Logout(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.clear();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        //return SignUpScreen();
        return LoginScreen();
      },
    ),
  );
}