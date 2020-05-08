import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';
import '../utills/databasehelpers.dart';

class TrasactionForm extends StatefulWidget {
  final ttlcnt = TextEditingController();
  final amtcnt = TextEditingController();
  final bool isUpdate;
  final id;
  
  
  TrasactionForm(this.isUpdate, this.id);

  @override
  _TrasactionFormState createState() => _TrasactionFormState();
}

class _TrasactionFormState extends State<TrasactionForm> {
  Databasehelper databasehelper = Databasehelper();
  Future<List<Transactions>> trans;
  Transactions tran = Transactions();

  refreshStudentList() {
    setState(() {
      databasehelper.getTrans();
    });
  }

  DateTime selecteddate;
  var expenses = [
    'Savings',
    'Home Loan/Rent',
    'Health',
    'Food',
    'Vacations',
    'Movies',
    'Gym',
    'Clothes',
    'Education',
    'Fuel',
    'Beverages',
    'Water bills',
    'Electricity',
    'Parties',
    'Gifts',
    'Cards bills',
    'Taxis/Public Transports',
    'Mobile bills',
    'Ohter expenses',
    
  ];

  var currentItem = 'Food';

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
    key: _formKey,
    child: Padding(
      padding: EdgeInsets.all(23),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            DropdownButton(
              items: expenses.map((String items) {
                return DropdownMenuItem<String>(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String itemSelected) {
                setState(() {
                  this.currentItem = itemSelected;
                });
              },
              value: currentItem,
              isExpanded: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Title"),
              controller: widget.ttlcnt,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: widget.amtcnt,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(selecteddate == null
                    ? "Choose Date"
                    : DateFormat.yMd().format(selecteddate)),
                IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      return datePicker(context);
                    }),
                FlatButton(
                  onPressed: () async {
                    //tran.title = "Shivs";
                    _submit(context);
                  },
                  child: Text(
                      widget.isUpdate == false
                          ? 'Add Transaction'
                          : 'Update',
                      style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ]),
    ));
  }

  void datePicker(BuildContext cnt) {
    showDatePicker(
            context: cnt,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        selecteddate = pickeddate;
      });
    });
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState.validate()) {
        if (widget.isUpdate == false) {
           print("${widget.isUpdate}............heloooooooo........");
          databasehelper.addTransToDatabase(Transactions(

              title: widget.ttlcnt.text,
              date: DateFormat.yMd().format(selecteddate),
              amount: double.parse(widget.amtcnt.text),
              category: currentItem,
              decider: currentItem == 'Savings' ? 1 :0,
              ));
        }
       else {
      
      databasehelper.update(Transactions(
        id: widget.id,
        title: widget.ttlcnt.text,
        date: DateFormat.yMd().format(selecteddate),
        amount: double.parse(widget.amtcnt.text),
        category: currentItem,
        decider: currentItem == 'Savings' ? 1 :0,
      ));
      refreshStudentList();
    }

    Navigator.of(context).pop();
  }
}

}