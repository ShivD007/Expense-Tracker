import 'package:flutter/material.dart';
import '../screens/homeBody.dart';
import '../screens/transactionform.dart';

import '../utills/databasehelpers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Databasehelper databasehelper = Databasehelper();

  bool isUpdate;
  
 


  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
      BottomNavigationBarItem(icon: Icon(Icons.content_cut),title: Text("Split"))
      
      ]), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,     
      floatingActionButton: FloatingActionButton(

          child: Icon(Icons.add),
          onPressed: () {
            isUpdate = false;
            TrasactionForm t = TrasactionForm(isUpdate, null);
            
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return GestureDetector(
                  child: t,
                  onTap: () {},
                  behavior: HitTestBehavior.opaque,
                );
              },
            );
          }),
      body: Column(
        children: <Widget>[
          //
          Expanded(child: HomeBody()),
        ],
      ),
    );
  }
   

}
