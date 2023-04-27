import 'package:flutter/material.dart';
import 'package:marathon/home.dart';
import 'package:marathon/signup.dart';
import 'package:marathon/login.dart';

void main() => runApp(MaterialApp(
        title: "Marathon Motors App",
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/signup': (context) => Signup(),
          '/home': (context) => Home(),
          '/login': (context) => Login(),
        }));
