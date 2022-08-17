import 'package:bill1/invoicePdf.dart';
import 'package:bill1/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text("Create your own bill",style: TextStyle(
                          color: Colors.black54
                      ),)
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/main.png"),
                        )),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Text('Login'),
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed:  () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>Signup()));
                          },
                          child: Text('Signup'),
                          style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                        ),
                      )
                    ],
                  ),
                ]
            ),
          ),
        )
    );
  }
}
