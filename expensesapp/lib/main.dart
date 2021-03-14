import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<transaction> transactions = [
    transaction(
        id: 1, amount: 11.0, date: DateTime.now(), title: 'Transaction1'),
    transaction(
        id: 2, amount: 10.0, date: DateTime.now(), title: 'Transaction2'),
    transaction(
        id: 3, amount: 20.0, date: DateTime.now(), title: 'Transaction3'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expenses app'),
            centerTitle: true,
            backgroundColor: Colors.purple,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: Container(
                  width: double.infinity,
                  child: Text('CHART!'),
                  color: Colors.purple,
                ),
              ),
              Card(
                child: Column(
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
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
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
                ),
              ),
            ],
          )),
    );
  }
}
