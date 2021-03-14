import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: titlecontroller,
          onChanged: (val) {},
        ),
        TextField(
          decoration: InputDecoration(labelText: 'amount'),
          controller: amountcontroller,
          onChanged: (val2) {
            // inputamount = val2;
          },
        ),
        FlatButton(
            onPressed: () {
              addTx(
                double.parse(amountcontroller.text),
                titlecontroller.text,
              );
            },
            child: Text('Add transaction'))
      ],
    );
  }
}
