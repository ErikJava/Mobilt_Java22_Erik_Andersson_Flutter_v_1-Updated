import 'package:flutter/material.dart';
import 'package:flutter_app/pages/contact.dart';
import 'package:flutter_app/pages/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/contact': (context) => const Contact(),
      },
    ));
