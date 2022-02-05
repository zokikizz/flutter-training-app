import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'services/login.service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailControl = TextEditingController();
  final passwordContol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    decoration: null,
                    child: Image.asset('asset/images/flutter-logo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailControl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0, 
                right: 15.0, 
                top: 15, 
                bottom: 0
                ),
              child: TextField(
                controller: passwordContol,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            // TODO: add forget password feature
            // TextButton(
            //   onPressed: (){
            //     // TODO: change this - login user

            //     Navigator.pushNamed(context, '/login');
            //   },
            //   child: const Text(
            //     'Forgot Password',
            //     style: TextStyle(color: Colors.blue, fontSize: 15),
            //   ),
            // ),
            Container(
              height: 60,
              width: 150,
              margin: const EdgeInsets.only(
                top: 15.0
              ),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  
                  EasyLoading.show(status: 'loading...');
                  await login(emailControl.text, passwordContol.text).then((value) {
                    EasyLoading.dismiss();
                    Navigator.pushNamed(context, '/home');
                  }).catchError((e) {
                    EasyLoading.dismiss();
                    EasyLoading.showError('Failed with Error');
                  });
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 150,
              margin: const EdgeInsets.only(
                top: 15.0
              ),
              child: 
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/activate');
                  },
                  child: const Text(
                    'Activate account',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
            // TODO: should be removed
            // const SizedBox(
            //   height: 130,
            // ),
              ),
          ],
        ),
      ),
    );
  }
}

