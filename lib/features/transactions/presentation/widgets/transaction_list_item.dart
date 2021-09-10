import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/core/presentation/routes.dart';
import 'package:flutter_appwrite_demo/features/auth/presentation/notifiers/auth_state.dart';
import 'package:flutter_appwrite_demo/features/transactions/data/model/transaction.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.arrow_circle_up),
      title: Text('${transaction.amount}',style: Theme.of(context).textTheme.headline5,),
      subtitle: Text( '${transaction.title}',style: Theme.of(context).textTheme.bodyText1,),
      trailing: Text( '${DateFormat.yMMMEd().format(transaction.transactionDate)}'),
    );
  }
}
