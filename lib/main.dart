import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_test/firebase_options.dart';
import 'package:firebase_test/screens/addproducts.dart';
import 'package:firebase_test/screens/home.dart';
import 'package:firebase_test/screens/login.dart';
import 'package:firebase_test/screens/register.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fire base demo",
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/register': (context) => const Register(),
        '/add': (context) => const ProductsAdd(),
        '/login': (context) => const Login(),
      },
    );
  }
}
