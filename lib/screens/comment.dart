// import 'package:flutter/material.dart';
// import '../models/transactions.dart';
// import '../screens/transactionTile.dart';
// import '../screens/transactionform.dart';

// import '../utills/databasehelpers.dart';
// import '../screens/dashboard.dart';

// class HomeBody extends StatefulWidget {
//   @override
//   _HomeBodyState createState() => _HomeBodyState();
// }

// class _HomeBodyState extends State<HomeBody> {
//   Databasehelper databasehelper;

//   Future<List<Transactions>> trans;

//   List<Transactions> transac = [];
//   bool isUpadte = false;
//   DismissDirection directions;

//   @override
//   void initState() {
//     super.initState();
//     databasehelper = Databasehelper();
//     refreshStudentList();
//   }

//   refreshStudentList() {
//     setState(() {
//       databasehelper.getTrans();
//       databasehelper.sum();
//       databasehelper.sums();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//         return FutureBuilder(
//             future: databasehelper.getTrans(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 transac = snapshot.data;
//                 return CustomScrollView(

//                   slivers: <Widget>[
//                     SliverAppBar(
//                                  backgroundColor: Colors.white,
//               floating: true,
//               pinned: true,
//               snap: false,
//               expandedHeight :size.height * .40,
//               flexibleSpace: FlexibleSpaceBar(
                 
//                  background: Stack(children:<Widget>[Container( 
                   
//                    height : 300,color:Colors.green),
                 
//                  Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0, top:270),
//               child: Container(
//               color: Colors.pink,
//               height: 140.0,
//               width: size.width-20.0,
//             ),),
                 
                 
                 
//                  ], )

//               ),



//             ),

//             SliverList(
            
            
            
//             delegate: SliverChildListDelegate([

//                 ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: transac == null ? 0 : transac.length,
//                     itemBuilder: (context, index) {
//                       Transactions tr = Transactions();
//                       tr = transac[index];

//                       return Dismissible(
//                         key: Key('${tr.id}'),
//                         background: Container(
//                             color: Colors.green,
//                             padding: EdgeInsets.only(left: 35),
//                             alignment: Alignment.centerLeft,
//                             child: Icon(Icons.edit, color: Colors.white)),
//                         secondaryBackground: Container(
//                             color: Colors.red,
//                             padding: EdgeInsets.only(right: 35),
//                             alignment: Alignment.centerRight,
//                             child: Icon(
//                               Icons.delete,
//                               color: Colors.white,
//                             )),
//                         confirmDismiss: (directions) async {
//                           if (directions == DismissDirection.startToEnd) {
//                             isUpadte = true;
//                             TrasactionForm t = TrasactionForm(isUpadte, tr.id);

//                             showModalBottomSheet(
//                               context: context,
//                               builder: (_) {
//                                 return GestureDetector(
//                                   child: t,
//                                   onTap: () {},
//                                   behavior: HitTestBehavior.opaque,
//                                 );
//                               },
//                             );
//                             t.ttlcnt.text = tr.title;
//                             t.amtcnt.text = tr.amount.toString();
//                             return false;
//                           } else if (directions ==
//                               DismissDirection.endToStart) {
//                             databasehelper.delete(tr.id);
//                             refreshStudentList();
//                             return true;
//                           }
//                           return null;
//                         },
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                                 width: 100,
//                                 height: 90,
//                                 margin: EdgeInsets.symmetric(
//                                     horizontal: 2, vertical: 13),
//                                 padding: EdgeInsets.all(15),
//                                 child: selectimg(tr.category)),
//                             Expanded(
//                               child: TransactionTile(
//                                 title: tr.title,
//                                 amount: tr.amount,
//                                 date: tr.date,
//                                 category: tr.category,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     })





//             ]))

    


                    
                  
//                   ]);



                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                 
//               }
//               return new CircularProgressIndicator();
//             },
//           );































    
    
//     // Column(
//     //   children: <Widget>[
//     //     Container(
//     //       height: MediaQuery.of(context).size.height * 0.2,
//     //       child: Center(
//     //           child: Dashboard(databasehelper.sum(), databasehelper.sums())),
//     //     ),
//     //     Expanded(
//     //       child: FutureBuilder(
//     //         future: databasehelper.getTrans(),
//     //         builder: (context, snapshot) {
//     //           if (snapshot.hasData) {
//     //             transac = snapshot.data;
//     //             return ListView.builder(
//     //                 shrinkWrap: true,
//     //                 itemCount: transac == null ? 0 : transac.length,
//     //                 itemBuilder: (context, index) {
//     //                   Transactions tr = Transactions();
//     //                   tr = transac[index];

//     //                   return Dismissible(
//     //                     key: Key('${tr.id}'),
//     //                     background: Container(
//     //                         color: Colors.green,
//     //                         padding: EdgeInsets.only(left: 35),
//     //                         alignment: Alignment.centerLeft,
//     //                         child: Icon(Icons.edit, color: Colors.white)),
//     //                     secondaryBackground: Container(
//     //                         color: Colors.red,
//     //                         padding: EdgeInsets.only(right: 35),
//     //                         alignment: Alignment.centerRight,
//     //                         child: Icon(
//     //                           Icons.delete,
//     //                           color: Colors.white,
//     //                         )),
//     //                     confirmDismiss: (directions) async {
//     //                       if (directions == DismissDirection.startToEnd) {
//     //                         isUpadte = true;
//     //                         TrasactionForm t = TrasactionForm(isUpadte, tr.id);

//     //                         showModalBottomSheet(
//     //                           context: context,
//     //                           builder: (_) {
//     //                             return GestureDetector(
//     //                               child: t,
//     //                               onTap: () {},
//     //                               behavior: HitTestBehavior.opaque,
//     //                             );
//     //                           },
//     //                         );
//     //                         t.ttlcnt.text = tr.title;
//     //                         t.amtcnt.text = tr.amount.toString();
//     //                         return false;
//     //                       } else if (directions ==
//     //                           DismissDirection.endToStart) {
//     //                         databasehelper.delete(tr.id);
//     //                         refreshStudentList();
//     //                         return true;
//     //                       }
//     //                       return null;
//     //                     },
//     //                     child: Row(
//     //                       children: <Widget>[
//     //                         Container(
//     //                             width: 100,
//     //                             height: 90,
//     //                             margin: EdgeInsets.symmetric(
//     //                                 horizontal: 2, vertical: 13),
//     //                             padding: EdgeInsets.all(15),
//     //                             child: selectimg(tr.category)),
//     //                         Expanded(
//     //                           child: TransactionTile(
//     //                             title: tr.title,
//     //                             amount: tr.amount,
//     //                             date: tr.date,
//     //                             category: tr.category,
//     //                           ),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   );
//     //                 });
//     //           }
//     //           return new CircularProgressIndicator();
//     //         },
//     //       ),
//     //     ),
//     //   ],
//     // );
//   }

//   Image selectimg(String value) {
//     switch (value) {
//       case "Food":
//         {
//           return Image(image: AssetImage('assets/images/Food.png'));
//         }
//         break;

//       case "Home Loan/Rent":
//         {
//           return Image(image: AssetImage('assets/images/Home_LoanRent.jpg'));
//         }
//         break;
//       case "Health":
//         {
//           return Image(image: AssetImage('assets/images/Health.jpg'));
//         }
//         break;
//       case "Vacations":
//         {
//           return Image(image: AssetImage('assets/images/Vacations.jpg'));
//         }
//         break;
//       case "Movies":
//         {
//           return Image(image: AssetImage('assets/images/Movies.jpg'));
//         }
//         break;
//       case "Gym":
//         {
//           return Image(image: AssetImage('assets/images/Gym.png'));
//         }
//         break;
//       case "Clothes":
//         {
//           return Image(image: AssetImage('assets/images/Clothes.png'));
//         }
//         break;
//       case "Education":
//         {
//           return Image(image: AssetImage('assets/images/Education.jpg'));
//         }
//         break;
//       case "Fuel":
//         {
//           return Image(image: AssetImage('assets/images/Fuel.jpg'));
//         }
//         break;
//       case "Ohter expenses":
//         {
//           return Image(image: AssetImage('assets/images/Ohter_expenses.png'));
//         }
//         break;
//       case "Beverages":
//         {
//           return Image(image: AssetImage('assets/images/Beverages.jpg'));
//         }
//         break;
//       case "Water bills":
//         {
//           return Image(image: AssetImage('assets/images/Water_bills.jpg'));
//         }
//         break;
//       case "Electricity":
//         {
//           return Image(image: AssetImage('assets/images/Electricity.jpg'));
//         }
//         break;
//       case "Parties":
//         {
//           return Image(image: AssetImage('assets/images/Parties.jpg'));
//         }
//         break;
//       case "Gifts":
//         {
//           return Image(image: AssetImage('assets/images/Gifts.jpg'));
//         }
//         break;
//       case "Cards bills":
//         {
//           return Image(image: AssetImage('assets/images/Cards_bills.jpg'));
//         }
//         break;
//       case "Taxis/Public Transports":
//         {
//           return Image(image: AssetImage('assets/images/Taxis.jpg'));
//         }
//         break;
//       case "Mobile bills":
//         {
//           return Image(image: AssetImage('assets/images/Mobile_bills.jpg'));
//         }
//         break;
//       case "Savings":
//         {
//           return Image(image: AssetImage('assets/images/Saving.jpg'));
//         }
//         break;
//       default:
//         {
//           return Image(image: AssetImage('assets/images/Food.png'));
//         }
//         break;
//     }
//   }
// }
