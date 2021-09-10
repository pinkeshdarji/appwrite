import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/core/presentation/routes.dart';
import 'package:flutter_appwrite_demo/features/transactions/presentation/widgets/transaction_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.profile);
            },
          ),
        ],
      ),
      body: ExpenseList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addTransaction),
      ),
    );
  }
}
