import 'package:expensesapp/widgets/usertransactions.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/usertransactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // String inputtitle;
  // double inputamount;

  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expenses app'),
            centerTitle: true,
            backgroundColor: Colors.purple,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  child: Container(
                    width: double.infinity,
                    child: Text('CHART!'),
                    color: Colors.purple,
                  ),
                ),
                UserTransactions(),
              ],
            ),
          )),
    );
  }
}
