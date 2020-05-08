
//import 'package:intl/intl.dart';

class Transactions {
  int id;
  String title;
  String date;
  double amount;
  String category;
  int decider;

  Transactions({
    this.id,
    this.title,
    this.date,
    this.amount,
    this.category,
    this.decider
    }
  );

  Map<String, dynamic> tomap() {
    var map = <String, dynamic>{

      'id':id,
      'title': title,
      'amount': amount,
       'date': date,
       'category' : category,
        'decider' : decider

    };
      
    return map;
  }

  Transactions.fromMaps(Map<String, dynamic> map) {
   id = map['id'];
   title = map['title'];
   amount = map['amount'];
   date = map['date'];
   category = map['category'];
   decider = map['decider'];  
   
  }
}
