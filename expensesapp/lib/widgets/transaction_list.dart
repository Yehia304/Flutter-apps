import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png'))
              ],
            )
          : Column(
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
                                      color: Theme.of(context).primaryColor,
                                      style: BorderStyle.solid)),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '\$${tx.amount}',
                                style: Theme.of(context).textTheme.title,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx.title,
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text(
                                DateFormat.yMMMEd().format(tx.date),
                                style: Theme.of(context).textTheme.title,
                              ),
                            ],
                          ),
                        ],
                      )),
                );
              }).toList(),
            ),
    );
  }
}
