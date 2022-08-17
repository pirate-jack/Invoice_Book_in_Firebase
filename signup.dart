import 'dart:math';

import 'package:bill1/invoicePdf.dart';
import 'package:bill1/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'auth.dart';



class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}
TextEditingController number = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController password = new TextEditingController();
TextEditingController conpassword = new TextEditingController();
class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Create your own account",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      TextField(
                        controller: number,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: "Enter your Number",
                          hintText: "Enter your Number",

                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: "Enter your Email",
                          hintText: "Enter your Email",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: "Enter your Password",
                          hintText: "Enter your Password",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: conpassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: "Enter your Confirm Password",
                          hintText: "Enter your Confirm Password",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            _signup(email.text, password.text);
                          },
                          child: Text('Signup'),
                          style:
                          ElevatedButton.styleFrom(shape: StadiumBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "You already have account ? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: "Log in",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _signup(email, password) async {
    print(email);
    print(password);
    AuthenticationHelper()
        .signUp(email: email, password: password)
        .then((result) {
      print("firebase_result $result");
      print(email);
      print(password);
      if (result == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>Login()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    });
  }
}
