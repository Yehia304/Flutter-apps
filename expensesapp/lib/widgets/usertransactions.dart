import 'package:expensesapp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  int id = 2;

  final List<transaction> transactions = [
    transaction(
        id: 1, title: 'Transaction1', date: DateTime.now(), amount: 10.0),
    transaction(
        id: 2, title: 'Transaction2', date: DateTime.now(), amount: 12.0)
  ];

  @override
  void _addtransaction(double txAmount, String txTitle) {
    final newTx = transaction(
        id: id + 1, amount: txAmount, title: txTitle, date: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addtransaction),
        TransactionList(transactions)
      ],
    );
  }
}
