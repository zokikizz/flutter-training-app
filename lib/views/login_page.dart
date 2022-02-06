import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/auth_token.dart';
import 'package:runner_project/notifier/auth.notifier.dart';
import '../services/login.service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final User _user = User(email: '', authToken: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: 
      SingleChildScrollView(
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child:  Column(
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
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _user.email = value;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter your email address'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _user.password = value;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password'),
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
                    if(!_formkey.currentState!.validate()) {
                      return;
                    }
                    
                    _formkey.currentState!.save();

                    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
                    login(_user, authNotifier, context);
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
        )
      ),
    );
  }
}

