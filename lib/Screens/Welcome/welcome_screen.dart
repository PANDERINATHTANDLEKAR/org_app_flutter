

import 'package:flutter/material.dart';

import '../../components/background.dart';
import '../../responsive.dart';
import '../Login/login_form2.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

String finalEmail="NA";

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();



}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void initState(){
    getValidationData().whenComplete(() async{

    });
    super.initState();
  }

  Future getValidationData () async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? obtainedEmail = "NA";
    String? isLogin = "false";
    obtainedEmail = preferences.getString('email');
    isLogin = preferences.getString('isLogin');

    setState(() {
      finalEmail = obtainedEmail!;
    });

    //if(finalEmail == null? log('Navigate to Login'):log('Navigate to Home'));
    print(obtainedEmail);
    if(isLogin == "true"){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            //return SignUpScreen();
            return LoginForm2();
          },
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: WelcomeImage(),
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            mobile: const MobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }

 }

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  void getData () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email_val = prefs.getString('email');
    var password_val = prefs.getString('password');
    log('getData_storeE: $email_val');
    log('getData_storeP: $password_val');
    //print(email);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const WelcomeImage(),
       /* Hero(
          tag: "data_btn",
          child: ElevatedButton(
            onPressed: () {
              getData();
            },
            child: Text(
              "GetData".toUpperCase(),
            ),
          ),
        ),*/
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(),
            ),
            Spacer(),

          ],
        ),
      ],
    );
  }

}
