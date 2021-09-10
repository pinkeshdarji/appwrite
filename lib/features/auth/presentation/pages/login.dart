import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/core/presentation/routes.dart';
import 'package:flutter_appwrite_demo/features/auth/presentation/notifiers/auth_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Appwrite Login'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const SizedBox(height: 20.0),
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
                child: Text("Login"),
                onPressed: () {
                  AuthState state =
                      Provider.of<AuthState>(context, listen: false);
                  state.login(_email.text, _password.text);
                },
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(onPressed: () => Navigator.pushNamed(context, AppRoutes.signup), child: Text("Create account"))
          ],
        ),
      ),
    );
  }
}
