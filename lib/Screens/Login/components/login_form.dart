import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../login_form2.dart';
import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';


final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email'
  ],
);

class LoginForm extends StatefulWidget {
   const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
 // final _formKey = GlobalKey<FormState>();

  final textEmail = TextEditingController();
  final textPassword = TextEditingController();

  final prefer = SharedPreferences.getInstance();

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    GoogleSignInAccount? user = _currentUser;
    //var emai_val = user?.email;
    //var name_val = user?.displayName;
    //log("email:"+emai_val!);
    //log("Name:"+name_val!);
    return SingleChildScrollView(
    child:  Form(

      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,

            textInputAction: TextInputAction.next,
            controller: textEmail,
            cursorColor: kPrimaryColor,
            onSaved: (email) {

            },
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
              obscureText: true,
              controller: textPassword,
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
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                log('data: ''inside press');
                print(textEmail.text+":"+textPassword.text);

                //redirectFun();
                // signIn(); // for Google login
                login(textEmail.text.toString(),textPassword.text.toString(),context);
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  void login(String email , password, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try{

      Response response = await post(
          Uri.parse('http://3.7.18.55:3000/skroman/userapi/loginemail'),
          body: {
            'emailId' : email,
            'password' : password
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        //var data = response.body.toString();
        print(data['msg']);
        print(data);
        setData(email,password);
        print('Login successfully');
        //showAlertDialog(context, data ['msg']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              //return SignUpScreen();
              return LoginForm2();
            },
          ),
        );

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  void setData (String email,String pass) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email_val = prefs.setString('email',email);
    var password_val = prefs.setString('password',pass);
    var isLogin_val = prefs.setString('isLogin',"true");
    log('data_storeE: $email');
    log('data_storeP: $pass');
    print(email);
  }

  void signOut(){
    _googleSignIn.disconnect();
  }

  Future<void> signIn() async{
    try{
      await _googleSignIn.signIn();
      var name = _currentUser!.displayName;
      log('email:  $name');
    }catch(e){
      print('Error signin: $e');
    }
  }

  showAlertDialog(BuildContext context, String msg) {
    if (msg == "success match password") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            //return SignUpScreen();
            return LoginForm2();
          },
        ),
      );
    } else {
      Widget continueButton = TextButton(
        child: Text("Continue"),
        onPressed: () {
          if (msg == "enter vaild password") {
            Navigator.of(context).pop();
          } else if (msg == "success match password") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  //return SignUpScreen();
                  return LoginForm2();
                },
              ),
            );
          } else {
            Navigator.of(context).pop();
          }
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("AlertDialog"),
        content: Text(" " + msg),
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
  }

}
