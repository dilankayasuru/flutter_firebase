import 'package:firebase_test/screens/addproducts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  final emailTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();
  String errorTxt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.0,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailTxtController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(64)),
                ),
                label: Text("Email"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: passwordTxtController,
              obscureText: true,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(64)),
                ),
                label: Text("Password"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: () async {
                try {
                  UserCredential credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailTxtController.text,
                          password: passwordTxtController.text);
                  Navigator.pushNamed(context, '/add');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print("No user found for that email.");
                    setState(() {
                      errorTxt = "Invalid email or password!";
                    });
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                    setState(() {
                      errorTxt = "Invalid email or password!";
                    });
                  }
                }
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: const Text(
                  textAlign: TextAlign.center,
                  "Sign in",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              errorTxt,
              style: const TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
