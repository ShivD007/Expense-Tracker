import 'package:flutter/material.dart';
import '../utills/databasehelpers.dart';

class TransactionTile extends StatefulWidget {
  final int id;
  final String title;

  final String date;
  final double amount;
  final String category;

  TransactionTile({
    this.id,
    this.title,
    this.date,
    this.amount,
    this.category,
  });

  @override
  _TransactionTileState createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  Databasehelper databasehelper = Databasehelper();

  
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(15 ),
      child: Row(
        children: <Widget>[
          
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.date,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  
                ),
                      
              ],
            ),
          ),
          Text(
            '₹ ' + widget.amount.toStringAsFixed(2),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: widget.category == 'Savings' ? Colors.green : Colors.red),
          ),
        ],
      ),
    );
  }
}
