import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/features/auth/presentation/notifiers/auth_state.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Appwrite Register'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const SizedBox(height: 20.0),
            TextField(
              controller: _name,
              decoration: InputDecoration(hintText: "name"),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _email,
              decoration: InputDecoration(hintText: "email"),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "password",
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: ElevatedButton(
                child: Text("Signup"),
                onPressed: () {
                  AuthState state =
                      Provider.of<AuthState>(context, listen: false);
                  state.createAccount(_name.text, _email.text, _password.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
