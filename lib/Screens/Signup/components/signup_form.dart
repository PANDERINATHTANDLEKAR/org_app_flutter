import 'package:flutter/material.dart';

import 'package:http/http.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'dart:async';
import 'dart:convert';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final textEmail = TextEditingController();
  final textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: textEmail,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              controller: textPassword,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              signUp(textEmail.text, textPassword.text, context);
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void signUp(String email , password, context) async {

  try{
    Response response = await post(
        Uri.parse('http://3.7.18.55:3000/skroman/userapi/registration'),
        body: {
          'emailId' : email,
          'password' : password,
          'confirmPassword' : password,
          'loginType' : 'skroman'
        }
    );

    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      //var data = response.body.toString();
      print(data['msg']);
      print(data);
      showAlertDialog(context,data['msg']);
      print('SignUp successfully');

    }else {
      print('failed');
    }
  }catch(e){
    print(e.toString());
  }
}

showAlertDialog(BuildContext context, String msg) {

    Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed:  () {

      if(msg == "Email Address is already registered"){
                Navigator.of(context).pop();
      }else if(msg == "User Registration Successfull"){
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            //return SignUpScreen();
            return LoginScreen();
          },
        ),
      );
      }else {
        Navigator.of(context).pop();
      }

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text(" "+msg),
    actions: [

      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}