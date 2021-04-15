import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void add() {
    if (titlecontroller.text.isEmpty ||
        double.parse(amountcontroller.text) <= 0) {
      return;
    } else {
      widget.addTx(
        double.parse(amountcontroller.text),
        titlecontroller.text,
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Card(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titlecontroller,
                  onChanged: (val) {},
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountcontroller,
                  keyboardType: TextInputType.number,
                  onChanged: (val2) {
                    // inputamount = val2;
                  },
                ),
              ),
              FlatButton(
                  onPressed: add,
                  child: Text(
                    'Add transaction',
                    style: TextStyle(color: Colors.purple),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
