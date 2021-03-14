import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  NewTransaction(this.addTx);

  void add() {
    if (titlecontroller.text.isEmpty ||
        double.parse(amountcontroller.text) <= 0) {
      return;
    } else {
      addTx(
        double.parse(amountcontroller.text),
        titlecontroller.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titlecontroller,
            onChanged: (val) {},
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            controller: amountcontroller,
            keyboardType: TextInputType.number,
            onChanged: (val2) {
              // inputamount = val2;
            },
          ),
          FlatButton(onPressed: add, child: Text('Add transaction'))
        ],
      ),
    );
  }
}
