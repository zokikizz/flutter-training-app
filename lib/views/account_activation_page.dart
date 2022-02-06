import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/activate_account.service.dart';


class AccountActivationPage extends StatefulWidget {
  const AccountActivationPage({Key? key}) : super(key: key);


  @override
  _AccountActivationState createState() => _AccountActivationState();
}

class _AccountActivationState extends State<AccountActivationPage> {

  final emailControl = TextEditingController();
  final activationCodeControl = TextEditingController();
  final passwordControl = TextEditingController();
  final confirmedPasswordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Activate account'),
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
              padding: const EdgeInsets.only(
                left: 15.0, 
                right: 15.0, 
                top: 15, 
                bottom: 0
                ),
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
                controller: activationCodeControl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Activation code',
                    hintText: 'Enter activation code'),
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
                controller: passwordControl,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
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
                controller: confirmedPasswordControl,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Re-enter secure password'),
              ),
            ),
            Container(
              height: 60,
              width: 250,
              margin: const EdgeInsets.only(
                top: 15.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {

                  if (passwordControl.text != confirmedPasswordControl.text) {
                    EasyLoading.showError('Passwords are not matching.');
                    return;
                  }
                  await activateAccount(activationCodeControl.text, passwordControl.text, emailControl.text, context);
                
                },
                child: const Text(
                  'Activate account',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

