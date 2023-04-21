import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tvnet/screens/dashboard.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_page';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  var showSpinner = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final isButtonDisabled = false;
  SnackBar userNotFoundSnackBar =
      const SnackBar(content: Text('Username or Password is incorrect'));

  String? get _emailErrorText {
    final text = _emailController.value.text;
    if (text.isEmpty) {
      return 'Email can\'t be empty';
    }
    if (text.length < 8) {
      return 'Too short';
    }
    return null;
  }

  String? get _passwordErrorText {
    final text = _passwordController.value.text;
    if (text.isEmpty) {
      return 'Password can\'t be empty';
    }
    if (text.length < 6) {
      return 'Password should be at least 6 characters';
    }
    return null;
  }

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                width: 150.0,
                height: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 150.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  errorText: _emailErrorText,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                onChanged: (_) => setState(() {
                  if (_passwordErrorText != null) {}
                }),
                decoration: InputDecoration(
                  hintText: 'Enter your password.',
                  errorText: _passwordErrorText,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.transparent,
                  child: MaterialButton(
                    color: Colors.lightBlueAccent,
                    disabledColor: Colors.grey.withOpacity(0.5),
                    elevation: 5,
                    disabledElevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    onPressed:
                        _emailErrorText.isNull && _passwordErrorText.isNull
                            ? _submit
                            : null,
                    minWidth: 200.0,
                    height: 42.0,
                    child: const Text(
                      'Log In',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submit() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: _emailController.value.text,
          password: _passwordController.value.text);
      pushCode(user);
      showSpinner = false;
    } catch (e) {
      print(e);
    }
  }

  pushCode(user) {
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    } else {
      setState(() {
        showSpinner = false;
      });

      //ScaffoldMessenger.of(context).showSnackBar(userNotFoundSnackBar);
    }
  }
}
