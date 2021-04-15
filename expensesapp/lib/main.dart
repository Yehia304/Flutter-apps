import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Quicksand',
          textTheme: ThemeData()
              .textTheme
              .copyWith(title: TextStyle(fontFamily: 'OpenSans'))),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void addNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addtransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  final List<transaction> transactions = [
    // transaction(
    //     id: 1, title: 'Transaction1', date: DateTime.now(), amount: 10.0),
    // transaction(
    //     id: 2, title: 'Transaction2', date: DateTime.now(), amount: 12.0)
  ];

  void _addtransaction(double txAmount, String txTitle) {
    if (txAmount <= 0 || txTitle.isEmpty) {
      return;
    }
    final newTx = transaction(
        id: id + 1, amount: txAmount, title: txTitle, date: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  int id = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses app',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => addNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              child: Container(
                width: double.infinity,
                child: Text('CHART!'),
              ),
            ),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addNewTransaction(context),
      ),
    );
  }
}
