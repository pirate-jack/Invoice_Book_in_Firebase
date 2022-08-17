import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
        margin: EdgeInsets.only(left: 10,right: 10),
        height: MediaQuery.of(context).size.height,
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
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login to your account",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
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
                        obscureText: true,
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
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            _signIn(email.text, password.text);
                           //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Text('Login'),
                          style:
                              ElevatedButton.styleFrom(shape: StadiumBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "You Don't have account ? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ]),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height /3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/login.png"),
                        )),
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
  Future<void> _signIn(email, password) async {
    print(email);
    print(password);
    AuthenticationHelper()
        .signIn(email: email, password: password)
        .then((result) {
      print("firebase_result $result");
      print(email);
      print(password);
      if (result == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>Home()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    });
  }
 }
