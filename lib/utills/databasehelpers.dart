import 'dart:async';
import 'dart:io';
import '../models/transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
   static Database _database;

  String transTable = 'Transactions_Table';
  String colId = 'id';
  String colTitle ='title';
  String colAmount = 'amount';
  String colDate ='date';
  String colCategory = 'category';
  String colDecider  = 'decider';
  

  Future<Database> get database async {
    if (_database != null) 
    {return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    String path = join(directory.path, 'Trasactions.db');
    var db = await openDatabase(path, version: 1,
        onCreate: _onCreate);
   
    return db;
  }

  

_onCreate(Database db, int version) async {
      db.execute(
          'CREATE TABLE $transTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colAmount DOUBLE, $colDate TEXT , $colCategory TEXT , $colDecider INTEGER )');    
 }   




  Future <List<Transactions>> getTrans() async {
    var dbClient = await database;
    final List<Map<String,dynamic>> maps = await dbClient.query(transTable);
    return List.generate(maps.length, (i){
      return Transactions(
        id: maps[i]['id'],
        title: maps[i]['title'],
        amount: maps[i]['amount'],
        date: maps[i]['date'],
        category : maps[i]['category'],
      );
    }); 

  }

 

Future<Transactions> addTransToDatabase(Transactions transaction) async {
    var dbClient = await database;
    transaction.id = await dbClient.insert(
      transTable,
      transaction.tomap(),
    
    );
    print('${transaction.id}..........................id ');
    return transaction;
  }


 Future<void> delete(int id) async {    
   var dbClient = await database; 
   print("delete");   
   return await dbClient.delete(    
     transTable,    
     where: '$colId = ?',    
     whereArgs: [id],    
     
   );    
 }    
     
 Future<int> update(Transactions transaction) async {    
   var dbClient = await database;    
   return await dbClient.update(    
     transTable,    
     transaction.tomap(),    
     where: '$colId = ? ',    
     whereArgs: [transaction.id],    
   );    
 }  


 Future<double> sum( ) async{
   var dbClient = await database; 
     var result = await dbClient.rawQuery("SELECT sum($colAmount) as Total  FROM $transTable WHERE $colDecider = 1 ");
     List value = result.toList();
     double total;
     value.forEach((f){
       total = f["Total"];
      
      });
     
return  total;
 }

 Future<double> sums() async{
   var dbClient = await database; 
     var result = await dbClient.rawQuery("SELECT sum($colAmount) as Total FROM $transTable WHERE $colDecider = 0");
     List value = result.toList();
     double total;
     value.forEach((f){
       total = f["Total"];
      
      });
     
return  total;
 }

  



  Future close() async {
    var dbClient = await database;
    dbClient.close();
  }
}
 