import 'package:firebase_test/screens/addproducts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;

  final emailTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();
  String errorTxt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                  await _auth.createUserWithEmailAndPassword(
                    email: emailTxtController.text,
                    password: passwordTxtController.text,
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ProductsAdd()),
                  );
                } on FirebaseAuthException catch (error) {
                  if (error.code == 'weak-password') {
                    setState(() {
                      errorTxt = 'The password provided is too weak.';
                    });
                  } else if (error.code == 'email-already-in-use') {
                    setState(() {
                      errorTxt = 'The account already exists for that email.';
                    });
                  }
                } catch (error) {
                  setState(() {
                    errorTxt = error.toString();
                  });
                }
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: const Text(
                  textAlign: TextAlign.center,
                  "Sign up",
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
