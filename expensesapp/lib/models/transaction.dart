import 'package:flutter/foundation.dart';

class transaction {
  int id;
  String title;
  DateTime date;
  double amount;

  transaction(
      {@required this.id,
      @required this.title,
      @required this.date,
      @required this.amount});
}
