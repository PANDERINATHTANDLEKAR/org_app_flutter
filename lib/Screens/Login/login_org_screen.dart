import 'package:flutter/material.dart';

class LoginOrgScreen extends StatelessWidget {
  const LoginOrgScreen({Key? key}) : super(key: key);

  static const title_Login = "Login Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_Login,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(title_Login),
        ),
        body: LoginOrgPage(),
      ),
    );
  }
}


class LoginOrgPage extends StatefulWidget {
  const LoginOrgPage({Key? key}) : super(key: key);

  @override
  State<LoginOrgPage> createState() => _LoginOrgPageState();
}

class _LoginOrgPageState extends State<LoginOrgPage> {

  TextEditingController nameControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  var isLoaded = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Orgowners/GroupOwn',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    print(nameControler.text);
                    print(passwordControler.text);
                  },
                  child: const Text('Sign Up ?',),
                ),
                ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameControler,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordControler,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password ?',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameControler.text);
                    print(passwordControler.text);
                  },
                )
            ),
            Column(
            children: <Widget>[
                const Text('or'),
                TextButton(
                  child: const Text(
                    'Gmail Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                ),
                TextButton(
                  child: const Text(
                    'Facebook Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }

}
