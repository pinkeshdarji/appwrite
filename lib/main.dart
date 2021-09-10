import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/core/presentation/routes.dart';
import 'package:flutter_appwrite_demo/features/auth/presentation/pages/login.dart';
import 'package:flutter_appwrite_demo/features/general/presentation/pages/home.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/notifiers/auth_state.dart';
import 'features/transactions/presentation/notifiers/transaction_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthState(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionState(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Appwrite Demo',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            buttonColor: Colors.deepPurple,
            inputDecorationTheme:
                InputDecorationTheme(border: OutlineInputBorder()),
            buttonTheme: ButtonThemeData(
              height: 50.0,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home: Consumer<AuthState>(
          builder: (context, state, child) {
            return state.isLoggedIn ? HomePage() : LoginPage();
          },
        ),
      ),
    );
  }
}
