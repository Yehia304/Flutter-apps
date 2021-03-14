import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Colors.purple,
                              style: BorderStyle.solid)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(tx.date),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              )),
        );
      }).toList(),
    );
  }
}
